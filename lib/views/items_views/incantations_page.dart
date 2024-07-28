// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:elden_nexus/firebase/auth/auth.dart';
import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/models/incantation.dart';
import 'package:elden_nexus/views/loading_screen.dart';
import 'package:elden_nexus/views/routing_view.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/constant.dart';
import '../home_page.dart';
import 'incantations_detail_page.dart';

class IncantationsPage extends StatefulWidget {
  final bool isDlc;

  const IncantationsPage({super.key, required this.isDlc});

  @override
  State<IncantationsPage> createState() => _IncantationsPageState();
}

class _IncantationsPageState extends State<IncantationsPage> {
  DatabaseMethods db = DatabaseMethods();
  late List<Incantation> incants;
  List<Incantation> displayedIncants = [];
  late Future<List<String>> futureFoundIncants;
  SortOption? selectedSortOption;
  late Future<void> initIncantsFuture;
  bool isSaving = false;
  bool isSaved = false;
  Timer? saveTimer;

  @override
  void initState() {
    super.initState();
    initIncantsFuture = initIncants();
    futureFoundIncants = db.getUserIncantations(Auth().currentUser!.uid);
  }

  Future<void> initIncants() async {
    incants = (await db.getAllIncantations(widget.isDlc))!;
    futureFoundIncants = db.getUserIncantations(Auth().currentUser!.uid);
    displayedIncants = List.from(incants);
    sortIncants(SortOption.name);
  }

  void setFoundIncants() async {
    futureFoundIncants = db.getUserIncantations(Auth().currentUser!.uid);
    displayedIncants = List.from(incants);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initIncantsFuture,
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
        if (displayedIncants != incants) {
          setState(() {
            displayedIncants = List.from(incants);
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
                            sortIncants(SortOption.name);
                          });
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                      ListTile(
                        title: Text('Not Found'),
                        onTap: () {
                          setState(() {
                            selectedSortOption = SortOption.notFound;
                            sortIncants(SortOption.notFound);
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
              future: futureFoundIncants,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    '${incants.where((inc) => snapshot.data!.contains(inc.name)).toList().length}/${incants.length}',
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
                  delegate: IncantsSearch(incants, (selectedIncants) {
                    setState(() {
                      displayedIncants = selectedIncants;
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
                  List<String> toStoreIncants = await futureFoundIncants;
                  await db.saveUserIncantations(
                      toStoreIncants, Auth().currentUser!.uid);
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
                future: futureFoundIncants,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                      child: Scrollbar(
                        thickness: 10,
                        interactive: true,
                        thumbVisibility: true,
                        child: ListView.builder(
                          itemCount: displayedIncants.length,
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
                                      .contains(displayedIncants[index].name),
                                  onChanged: (bool? value) {
                                    if (saveTimer != null) {
                                      saveTimer!.cancel(); // Cancel the previous timer if it's still running
                                    }
                                    saveTimer = Timer(const Duration(milliseconds: 500), () async {
                                      if (value!) {
                                        await db.addUserIncantation(displayedIncants[index].name, Auth().currentUser!.uid);
                                      } else {
                                        await db.removeUserIncantation(displayedIncants[index].name, Auth().currentUser!.uid);
                                      }
                                    });
                                    setState(() {
                                      if (value == true) {
                                        if (!snapshot.data!.contains(
                                            displayedIncants[index].name)) {
                                          snapshot.data!
                                              .add(displayedIncants[index].name);
                                        }
                                      } else {
                                        if (snapshot.data!.contains(
                                            displayedIncants[index].name)) {
                                          snapshot.data!.remove(
                                              displayedIncants[index].name);
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
                                                    IncantationDetailPage(
                                                        incant: displayedIncants[
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
                                                displayedIncants[index].image),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              displayedIncants[index].name,
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

  void sortIncants(SortOption? option) async {
    setState(() {
      if (option == SortOption.name) {
        setState(() {
          displayedIncants = incants;
          displayedIncants.sort((a, b) => a.name.compareTo(b.name));
        });
      } else if (option == SortOption.notFound) {
        futureFoundIncants.then((foundIncants) {
          setState(() {
            displayedIncants =
                incants.where((inc) => !foundIncants.contains(inc.name)).toList();
            displayedIncants.sort((a, b) => a.name.compareTo(b.name));
          });
        });
      }
    });
  }
}

class IncantsSearch extends SearchDelegate<Incantation> {
  final List<Incantation> incants;
  final Function(List<Incantation>) onIncantsSelected;

  IncantsSearch(this.incants, this.onIncantsSelected);

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
            Incantation(
                name: '',
                image: '',
                slots: 0,
                description: '',
                howToFind: '',
                mapLink: '', fPCost: 0, damageType: '', effect: '', requirement: SpellsRequirement()));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = incants
        .where((inc) => inc.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onIncantsSelected(results);
    });

    return _buildSuggestionList(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? incants
        : incants
        .where(
            (inc) => inc.name.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return _buildSuggestionList(suggestionList);
  }

  Widget _buildSuggestionList(List<Incantation> suggestionList) {
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].name),
          onTap: () {
            onIncantsSelected([suggestionList[index]]);
            close(context, suggestionList[index]);
          },
        );
      },
    );
  }
}

enum SortOption { name, notFound }
