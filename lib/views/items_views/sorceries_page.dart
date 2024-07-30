// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:elden_nexus/firebase/auth/auth.dart';
import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/models/sorcery.dart';
import 'package:elden_nexus/views/loading_screen.dart';
import 'package:elden_nexus/views/routing_view.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/constant.dart';
import '../welcome_page.dart';
import 'sorceries_detail_page.dart';

class SorceriesPage extends StatefulWidget {
  final bool isDlc;

  const SorceriesPage({super.key, required this.isDlc});

  @override
  State<SorceriesPage> createState() => _SorceriesPageState();
}

class _SorceriesPageState extends State<SorceriesPage> {
  DatabaseMethods db = DatabaseMethods();
  late List<Sorcery> sorceries;
  List<Sorcery> displayedSorceries = [];
  late Future<List<String>> futureFoundSorceries;
  SortOption? selectedSortOption;
  late Future<void> initSorceriesFuture;
  Timer? saveTimer;

  @override
  void initState() {
    super.initState();
    initSorceriesFuture = initSorceries();
    futureFoundSorceries = db.getUserSorceries(Auth().currentUser!.uid);
  }

  Future<void> initSorceries() async {
    sorceries = (await db.getAllSorceries(widget.isDlc))!;
    futureFoundSorceries = db.getUserSorceries(Auth().currentUser!.uid);
    displayedSorceries = List.from(sorceries);
    sortSorceries(SortOption.name);
  }

  void setFoundSorceries() async {
    futureFoundSorceries = db.getUserSorceries(Auth().currentUser!.uid);
    displayedSorceries = List.from(sorceries);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initSorceriesFuture,
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
        if (displayedSorceries != sorceries) {
          setState(() {
            displayedSorceries = List.from(sorceries);
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
                            sortSorceries(SortOption.name);
                          });
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                      ListTile(
                        title: Text('Not Found'),
                        onTap: () {
                          setState(() {
                            selectedSortOption = SortOption.notFound;
                            sortSorceries(SortOption.notFound);
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
              future: futureFoundSorceries,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    '${sorceries.where((sorc) => snapshot.data!.contains(sorc.name)).toList().length}/${sorceries.length}',
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
                  delegate: SorceriesSearch(sorceries, (selectedSorceries) {
                    setState(() {
                      displayedSorceries = selectedSorceries;
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
                future: futureFoundSorceries,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                      child: Scrollbar(
                        thickness: 10,
                        interactive: true,
                        thumbVisibility: true,
                        child: ListView.builder(
                          itemCount: displayedSorceries.length,
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
                                      .contains(displayedSorceries[index].name),
                                  onChanged: (bool? value) {
                                    if (saveTimer != null) {
                                      saveTimer!
                                          .cancel(); // Cancel the previous timer if it's still running
                                    }
                                    saveTimer =
                                        Timer(const Duration(milliseconds: 500),
                                            () async {
                                      if (value!) {
                                        await db.addUserSorcery(
                                            displayedSorceries[index].name,
                                            Auth().currentUser!.uid);
                                      } else {
                                        await db.removeUserSorcery(
                                            displayedSorceries[index].name,
                                            Auth().currentUser!.uid);
                                      }
                                    });
                                    setState(() {
                                      if (value == true) {
                                        if (!snapshot.data!.contains(
                                            displayedSorceries[index].name)) {
                                          snapshot.data!.add(
                                              displayedSorceries[index].name);
                                        }
                                      } else {
                                        if (snapshot.data!.contains(
                                            displayedSorceries[index].name)) {
                                          snapshot.data!.remove(
                                              displayedSorceries[index].name);
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
                                                    SorceryDetailPage(
                                                        sorc:
                                                            displayedSorceries[
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
                                                displayedSorceries[index]
                                                    .image),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              displayedSorceries[index].name,
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

  void sortSorceries(SortOption? option) async {
    setState(() {
      if (option == SortOption.name) {
        setState(() {
          displayedSorceries = sorceries;
          displayedSorceries.sort((a, b) => a.name.compareTo(b.name));
        });
      } else if (option == SortOption.notFound) {
        futureFoundSorceries.then((foundSorceries) {
          setState(() {
            displayedSorceries = sorceries
                .where((sorc) => !foundSorceries.contains(sorc.name))
                .toList();
            displayedSorceries.sort((a, b) => a.name.compareTo(b.name));
          });
        });
      }
    });
  }
}

class SorceriesSearch extends SearchDelegate<Sorcery> {
  final List<Sorcery> sorceries;
  final Function(List<Sorcery>) onSorceriesSelected;

  SorceriesSearch(this.sorceries, this.onSorceriesSelected);

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
            Sorcery(
                name: '',
                image: '',
                slots: 0,
                description: '',
                howToFind: '',
                mapLink: '',
                fPCost: 0,
                damageType: '',
                effect: '',
                requirement: SpellsRequirement()));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = sorceries
        .where((sorc) => sorc.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onSorceriesSelected(results);
    });

    return _buildSuggestionList(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? sorceries
        : sorceries
            .where((sorc) =>
                sorc.name.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return _buildSuggestionList(suggestionList);
  }

  Widget _buildSuggestionList(List<Sorcery> suggestionList) {
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].name),
          onTap: () {
            onSorceriesSelected([suggestionList[index]]);
            close(context, suggestionList[index]);
          },
        );
      },
    );
  }
}

enum SortOption { name, notFound }
