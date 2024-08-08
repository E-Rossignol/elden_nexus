// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/views/loading_screen.dart';
import 'package:elden_nexus/views/routing_view.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../models/tear.dart';
import '../home_page.dart';
import 'tears_detail_page.dart';

class TearsPage extends StatefulWidget {
  final bool isDlc;
  const TearsPage({super.key, required this.isDlc});

  @override
  State<TearsPage> createState() => _TearsPageState();
}

class _TearsPageState extends State<TearsPage> {
  DatabaseMethods db = DatabaseMethods.instance;
  late List<Tear> tears;
  List<Tear> displayedTears = [];
  late Future<List<String>> futureFoundTears;
  SortOption? selectedSortOption;
  late Future<void> initTearsFuture;
  late String id = '';

  @override
  void initState() {
    super.initState();
    tears = widget.isDlc ? db.allDBSOTETears : db.allDBTears;
    initTearsFuture = initTals();
    futureFoundTears = Future.value([]);
  }

  Future<void> initTals() async {
    id = await FlutterSecureStorage().read(key: 'id') ?? '';
    futureFoundTears = db.getUserTears(id);
    displayedTears = List.from(tears);
    sortTals(SortOption.defaultSort);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initTearsFuture,
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
      onPopInvoked: (result) {
        if (displayedTears != tears) {
          setState(() {
            displayedTears = List.from(tears);
          });
        }
      },
      child: Scaffold(
        endDrawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.background,
          child: SettingsView(),
        ),
        drawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.background,
          child: const RoutingView(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Opacity(
          opacity: 0.8,
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
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
                          title: Text('Default'),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.defaultSort;
                              sortTals(SortOption.defaultSort);
                            });
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
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
            child: Icon(Icons.sort, color: Theme.of(context).colorScheme.secondaryContainer),
          ),
        ),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu_rounded),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          actions: <Widget>[
            FutureBuilder(
              future: futureFoundTears,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    '${tears.where((tal) => snapshot.data!.contains(tal.name)).toList().length}/${tears.length}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20,
                    ),
                  );
                } else {
                  return const Text("");
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(isDlc: widget.isDlc),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: talsSearch(tears, (selectedTals) {
                    setState(() {
                      displayedTears = selectedTals;
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
        body: displayedTears.isEmpty ?
        Center(
          child: Text("Nothing to display".toUpperCase(), style: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontSize: 20, fontFamily: 'Mantinia')
        ))
        :Center(
          child: Column(
            children: [
              FutureBuilder(
                future: futureFoundTears,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                      child: Scrollbar(
                        thickness: 10,
                        interactive: true,
                        thumbVisibility: true,
                        child: ListView.builder(
                          itemCount: displayedTears.length,
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
                                      .contains(displayedTears[index].name),
                                  onChanged: (bool? value) async {
                                    setState(() {
                                      if (value == true) {
                                        if (!snapshot.data!.contains(
                                            displayedTears[index].name)) {
                                          snapshot.data!
                                              .add(displayedTears[index].name);
                                        }
                                      } else {
                                        if (snapshot.data!.contains(
                                            displayedTears[index].name)) {
                                          snapshot.data!.remove(
                                              displayedTears[index].name);
                                        }
                                      }
                                    });
                                      if (value!) {
                                        await db.addUserTear(
                                            displayedTears[index].name,
                                            id);
                                      } else {
                                        await db.removeUserTear(
                                            displayedTears[index].name,
                                            id);
                                      }
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
                                                    TearDetailPage(
                                                        tear: displayedTears[
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
                                                displayedTears[index].image),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              displayedTears[index].name,
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
                    return SpinKitSpinningLines(
                      color: Theme.of(context).colorScheme.primary,
                      size: 50.0,
                    );
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
          displayedTears = tears;
          displayedTears.sort((a, b) => a.name.compareTo(b.name));
        });
      } else if (option == SortOption.notFound) {
        futureFoundTears.then((foundtals) {
          setState(() {
            displayedTears =
                tears.where((tal) => !foundtals.contains(tal.name)).toList();
            displayedTears.sort((a, b) => a.name.compareTo(b.name));
          });
        });
      }
      else if (option == SortOption.defaultSort){
        List<String> defaultOrder = [
          "Crimson Crystal Tear",
          "Crimsonspill Crystal Tear",
          "Crimsonburst Crystal Tear",
          "Crimsonburst Dried Tear",
          "Cerulean Crystal Tear",
          "Greenspill Crystal Tear",
          "Greenburst Crystal Tear",
          "Strength-knot Crystal Tear",
          "Dexterity-knot Crystal Tear",
          "Intelligence-knot Crystal Tear",
          "Faith-knot Crystal Tear",
          "Opaline Hardtear",
          "Speckled Hardtear",
          "Leaden Hardtear",
          "Deflecting Hardtear",
          "Magic-shrouding Cracked Tear",
          "Flame-shrouding Cracked Tear",
          "Lightning-shrouding Cracked Tear",
          "Holy-shrouding Cracked Tear",
          "Stonebarb Cracked Tear",
          "Spiked Cracked Tear",
          "Thorny Cracked Tear",
          "Crimson-Sapping Cracked Tear",
          "Cerulean-Sapping Cracked Tear",
          "Bloddsucking Cracked Tear",
          "Twiggy Cracked Tear",
          "Winged Crystal Tear",
          "Windy Crystal Tear",
          "Glovewort Crystal Tear",
          "Crimson Bubbletear",
          "Crimsonwhorl Bubbletear",
          "Opaline Bubbletear",
          "Cerulean Hidden Tear",
          "Viridian Hidden Tear",
          "Purifying Crystal Tear",
          "Ruptured Crystal Tear",
          "Oil-Soacked Tear",
        ];
        setState(() {
          displayedTears = tears;
          displayedTears.sort((a, b) => defaultOrder.indexOf(a.name).compareTo(defaultOrder.indexOf(b.name)));
        });
      }
    });
  }
}

class talsSearch extends SearchDelegate<Tear> {
  final List<Tear> tals;
  final Function(List<Tear>) ontalsSelected;

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
            Tear(
                name: '',
                image: '',
                mapLink: '',
                effect: "",
                howToFind: "",
                duration: -1));
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
                (tal) => tal.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return _buildSuggestionList(suggestionList);
  }

  Widget _buildSuggestionList(List<Tear> suggestionList) {
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

enum SortOption { name, notFound, defaultSort }