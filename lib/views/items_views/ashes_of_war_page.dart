import 'dart:async';

import 'package:elden_nexus/firebase/auth/auth.dart';
import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/models/ash_of_war.dart';
import 'package:elden_nexus/views/loading_screen.dart';
import 'package:elden_nexus/views/routing_view.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_page.dart';
import 'ashes_of_war_detail_page.dart';

class AshesOfWarPage extends StatefulWidget {
  final bool isDlc;

  const AshesOfWarPage({super.key, required this.isDlc});

  @override
  State<AshesOfWarPage> createState() => _AshesOfWarPageState();
}

class _AshesOfWarPageState extends State<AshesOfWarPage> {
  DatabaseMethods db = DatabaseMethods();
  late List<AshOfWar> ashes;
  List<AshOfWar> displayedAshes = [];
  late Future<List<String>> futureFoundAshes;
  SortOption? selectedSortOption;
  late Future<void> initAshesFuture;
  bool isSaving = false;
  bool isSaved = false;
  Timer? saveTimer;

  @override
  void initState() {
    super.initState();
    initAshesFuture = initAshes();
    futureFoundAshes = db.getUserAshes(Auth().currentUser!.uid);
  }

  Future<void> initAshes() async {
    ashes = (await db.getAllAow(widget.isDlc))!;
    futureFoundAshes = db.getUserAshes(Auth().currentUser!.uid);
    displayedAshes = List.from(ashes);
    sortAshes(SortOption.name);
  }

  void setFoundAshes() async {
    futureFoundAshes = db.getUserAshes(Auth().currentUser!.uid);
    displayedAshes = List.from(ashes);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initAshesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // The Future is complete, return the main widget
          return buildMainWidget(context);
        } else {
          // The Future is not complete, return a loading indicator
          return const LoadingScreen();
        }
      },
    );
  }

  Widget buildMainWidget(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (context) {
        if (displayedAshes != ashes) {
          setState(() {
            displayedAshes = List.from(ashes);
          });
        }
      },
      child: Scaffold(
        endDrawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.background,
          child: const SettingsView(),
        ),
        drawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.background,
          child: const RoutingView(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Sort by:'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text('Name'),
                        onTap: () {
                          setState(() {
                            selectedSortOption = SortOption.name;
                            sortAshes(SortOption.name);
                          });
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                      ListTile(
                        title: Text('Not Found'),
                        onTap: () {
                          setState(() {
                            selectedSortOption = SortOption.notFound;
                            sortAshes(SortOption.notFound);
                          });
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.sort),
        ),
        appBar: AppBar(
          leading: Row(
            children: [
              Expanded(
                child: Builder(builder: (context){
                  return IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomePage(isDlc: widget.isDlc),
                        ),
                      );
                    },
                  );
                }),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Builder(builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.menu_rounded),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FutureBuilder(
              future: futureFoundAshes,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    '${ashes.where((ash) => snapshot.data!.contains(ash.name)).toList().length}/${ashes.length}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20,
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: AshesSearch(ashes, (selectedAshes) {
                    setState(() {
                      displayedAshes = selectedAshes;
                    });
                  }),
                );
              },
            ),
            Builder(
              builder: (context) => IconButton(
                icon: isSaving
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator())
                    : isSaved
                        ? const Icon(Icons.check) // Display "ok" icon
                        : const Icon(Icons.save), // Display save icon
                onPressed: isSaving
                    ? null
                    : () async {
                        setState(() {
                          isSaving = true;
                          isSaved = false;
                        });
                        List<String> toStoreAshes = await futureFoundAshes;
                        await db.saveUserAshes(
                            toStoreAshes, Auth().currentUser!.uid);
                        setState(() {
                          isSaving = false;
                          isSaved = true;
                        });
                        // After 1 second, set isSaved back to false
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            isSaved = false;
                          });
                        });
                      },
              ),
            ),
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              FutureBuilder(
                future: futureFoundAshes,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                      child: Scrollbar(
                        thickness: 10,
                        interactive: true,
                        thumbVisibility: true,
                        child: ListView.builder(
                          itemCount: displayedAshes.length,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: const EdgeInsets.all(10),
                                // Add some margin around each ListTile
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  // Change the color of the ListTile
                                  borderRadius: BorderRadius.circular(10),
                                  // Add some border radius to the ListTile
                                  boxShadow: [
                                    // Add some shadow to the ListTile
                                    BoxShadow(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer,
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(1, 1),
                                    ),
                                  ],
                                ),
                                child: CheckboxListTile(
                                  value: snapshot.data!
                                      .contains(displayedAshes[index].name),
                                  onChanged: (bool? value) {
                                    if (saveTimer != null) {
                                      saveTimer!.cancel(); // Cancel the previous timer if it's still running
                                    }
                                    saveTimer = Timer(const Duration(milliseconds: 500), () async {
                                      if (value!) {
                                        await db.addUserAsh(displayedAshes[index].name, Auth().currentUser!.uid);
                                      } else {
                                        await db.removeUserAsh(displayedAshes[index].name, Auth().currentUser!.uid);
                                      }
                                    });
                                    setState(() {
                                      if (value == true) {
                                        if (!snapshot.data!.contains(
                                            displayedAshes[index].name)) {
                                          snapshot.data!
                                              .add(displayedAshes[index].name);
                                        }
                                      } else {
                                        if (snapshot.data!.contains(
                                            displayedAshes[index].name)) {
                                          snapshot.data!.remove(
                                              displayedAshes[index].name);
                                        }
                                      }
                                    });
                                  },
                                  title: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.info_outline,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AshOfWarDetailPage(
                                                        ash: displayedAshes[
                                                            index]),
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: ClipRRect(
                                            // Clip the image to make it circular
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            child: Image.asset(
                                                displayedAshes[index].image),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              displayedAshes[index].name,
                                              style: const TextStyle(
                                                // Add some style to the text
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          },
                        ),
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sortAshes(SortOption? option) async {
    setState(() {
      if (option == SortOption.name) {
        setState(() {
          displayedAshes = ashes;
          displayedAshes.sort((a, b) => a.name.compareTo(b.name));
        });
      } else if (option == SortOption.notFound) {
        futureFoundAshes.then((foundAshes) {
          setState(() {
            displayedAshes =
                ashes.where((ash) => !foundAshes.contains(ash.name)).toList();
            displayedAshes.sort((a, b) => a.name.compareTo(b.name));
          });
        });
      }
    });
  }
}

class AshesSearch extends SearchDelegate<AshOfWar> {
  final List<AshOfWar> ashes;
  final Function(List<AshOfWar>) onAshesSelected;

  AshesSearch(this.ashes, this.onAshesSelected);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(
            context,
            AshOfWar(
                name: '',
                image: '',
                description: '',
                howToFind: '',
                mapLink: ''));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = ashes
        .where((ash) => ash.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onAshesSelected(results);
    });

    return _buildSuggestionList(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? ashes
        : ashes
            .where(
                (ash) => ash.name.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return _buildSuggestionList(suggestionList);
  }

  Widget _buildSuggestionList(List<AshOfWar> suggestionList) {
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].name),
          onTap: () {
            onAshesSelected([suggestionList[index]]);
            close(context, suggestionList[index]);
          },
        );
      },
    );
  }
}

enum SortOption { name, notFound }
