// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:elden_nexus/firebase/auth/auth.dart';
import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/views/loading_screen.dart';
import 'package:elden_nexus/views/routing_view.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/talisman.dart';
import '../welcome_page.dart';
import 'talismans_detail_page.dart';

class TalismansPage extends StatefulWidget {
  final bool isDlc;

  const TalismansPage({super.key, required this.isDlc});

  @override
  State<TalismansPage> createState() => _TalismansPageState();
}

class _TalismansPageState extends State<TalismansPage> {
  DatabaseMethods db = DatabaseMethods();
  late List<Talisman> tals;
  List<Talisman> displayedTals = [];
  late Future<List<String>> futureFoundTals;
  SortOption? selectedSortOption;
  late Future<void> initTalsFuture;
  Timer? saveTimer;

  @override
  void initState() {
    super.initState();
    initTalsFuture = initTals();
    futureFoundTals = db.getUserTalismans(Auth().currentUser!.uid);
  }

  Future<void> initTals() async {
    tals = (await db.getAllTalismans(widget.isDlc))!;
    futureFoundTals = db.getUserTalismans(Auth().currentUser!.uid);
    displayedTals = List.from(tals);
    sortTals(SortOption.name);
  }

  void setFoundtals() async {
    futureFoundTals = db.getUserTalismans(Auth().currentUser!.uid);
    displayedTals = List.from(tals);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initTalsFuture,
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
        if (displayedTals != tals) {
          setState(() {
            displayedTals = List.from(tals);
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
                            sortTals(SortOption.name);
                          });
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                      ListTile(
                        title: Text('Not Found'),
                        onTap: () {
                          setState(() {
                            selectedSortOption = SortOption.notFound;
                            sortTals(SortOption.notFound);
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
          leading: IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          actions: <Widget>[
            FutureBuilder(
              future: futureFoundTals,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    '${tals.where((tal) => snapshot.data!.contains(tal.name)).toList().length}/${tals.length}',
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
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomePage(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: talsSearch(tals, (selectedTals) {
                    setState(() {
                      displayedTals = selectedTals;
                    });
                  }),
                );
              },
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
                future: futureFoundTals,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                      child: Scrollbar(
                        thickness: 10,
                        interactive: true,
                        thumbVisibility: true,
                        child: ListView.builder(
                          itemCount: displayedTals.length,
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
                                      .contains(displayedTals[index].name),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (saveTimer != null) {
                                        saveTimer!
                                            .cancel(); // Cancel the previous timer if it's still running
                                      }
                                      saveTimer = Timer(
                                          const Duration(milliseconds: 500),
                                          () async {
                                        if (value!) {
                                          await db.addUserTalisman(
                                              displayedTals[index].name,
                                              Auth().currentUser!.uid);
                                        } else {
                                          await db.removeUserTalisman(
                                              displayedTals[index].name,
                                              Auth().currentUser!.uid);
                                        }
                                      });
                                      if (value == true) {
                                        if (!snapshot.data!.contains(
                                            displayedTals[index].name)) {
                                          snapshot.data!
                                              .add(displayedTals[index].name);
                                        }
                                      } else {
                                        if (snapshot.data!.contains(
                                            displayedTals[index].name)) {
                                          snapshot.data!.remove(
                                              displayedTals[index].name);
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
                                                    TalismanDetailPage(
                                                        tal: displayedTals[
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
                                                displayedTals[index].image),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              displayedTals[index].name,
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

  void sortTals(SortOption? option) async {
    setState(() {
      if (option == SortOption.name) {
        setState(() {
          displayedTals = tals;
          displayedTals.sort((a, b) => a.name.compareTo(b.name));
        });
      } else if (option == SortOption.notFound) {
        futureFoundTals.then((foundtals) {
          setState(() {
            displayedTals =
                tals.where((tal) => !foundtals.contains(tal.name)).toList();
            displayedTals.sort((a, b) => a.name.compareTo(b.name));
          });
        });
      }
    });
  }
}

class talsSearch extends SearchDelegate<Talisman> {
  final List<Talisman> tals;
  final Function(List<Talisman>) ontalsSelected;

  talsSearch(this.tals, this.ontalsSelected);

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
            Talisman(
                name: '',
                image: '',
                mapLink: '',
                description: '',
                effect: "",
                howToFind: "",
                weight: -1));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = tals
        .where((tal) => tal.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ontalsSelected(results);
    });

    return _buildSuggestionList(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? tals
        : tals
            .where(
                (tal) => tal.name.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return _buildSuggestionList(suggestionList);
  }

  Widget _buildSuggestionList(List<Talisman> suggestionList) {
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].name),
          onTap: () {
            ontalsSelected([suggestionList[index]]);
            close(context, suggestionList[index]);
          },
        );
      },
    );
  }
}

enum SortOption { name, notFound }
