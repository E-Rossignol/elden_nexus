// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:elden_nexus/constants/constant.dart';
import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/views/loading_screen.dart';
import 'package:elden_nexus/views/routing_view.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../models/armor.dart';
import '../../models/armor_set.dart';
import '../home_page.dart';
import 'armors_set_detail_page.dart';

class ArmorSetsPage extends StatefulWidget {
  final bool isDlc;

  const ArmorSetsPage({super.key, required this.isDlc});

  @override
  State<ArmorSetsPage> createState() => _ArmorSetsPageState();
}

class _ArmorSetsPageState extends State<ArmorSetsPage> {
  DatabaseMethods db = DatabaseMethods.instance;
  late List<ArmorSet> armors;
  late List<Armor> armorPieces;
  List<ArmorSet> displayedArmors = [];
  late Future<List<String>> futureFoundArmors;
  SortOption? selectedSortOption;
  late Future<void> initArmorsFuture;
  late String id = '';

  @override
  void initState() {
    super.initState();
    armors = widget.isDlc ? db.allDBSOTEArmorSets : db.allDBArmorSets;
    armorPieces = widget.isDlc ? db.allDBSOTEArmors : db.allDBArmors;
    initArmorsFuture = initArmors();
    futureFoundArmors = Future.value([]);
  }

  Future<void> initArmors() async {
    id = await FlutterSecureStorage().read(key: 'id') ?? '';
    futureFoundArmors = db.getUserArmors(id);
    displayedArmors = List.from(armors);
    sortArmors(SortOption.name);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initArmorsFuture,
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
      canPop: false,
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
                          title: Text('Name'),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.name;
                              sortArmors(SortOption.name);
                            });
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
                        ListTile(
                          title: Text('Weight'),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.weight;
                              sortArmors(SortOption.weight);
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
            child: Icon(Icons.sort,
                color: Theme.of(context).colorScheme.secondaryContainer),
          ),
        ),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.arrow_circle_left_outlined,
                  color: Theme.of(context).colorScheme.onSurface),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(isDlc: widget.isDlc),
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            FutureBuilder(
              future: futureFoundArmors,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    '${armorPieces.where((armor) => snapshot.data!.contains(armor.name)).toList().length}/${armorPieces.length}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20,
                    ),
                  );
                } else {
                  return Text("",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 20));
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: armorsSearch(armors, (selectedArmors) {
                    setState(() {
                      displayedArmors = selectedArmors;
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
              Expanded(
                child: Scrollbar(
                  thickness: 10,
                  interactive: true,
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: displayedArmors.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.all(15),
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
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.08,
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
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ArmorSetDetailPage(
                                                  armorSet:
                                                      displayedArmors[index]),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 30),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    width: MediaQuery.of(context).size.height *
                                        0.08,
                                    child: ClipRRect(
                                      // Clip the image to make it circular
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.asset(
                                          displayedArmors[index].image),
                                    ),
                                  ),
                                  const SizedBox(width: 30),
                                  Text(
                                    displayedArmors[index].name,
                                    style: const TextStyle(
                                      // Add some style to the text
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sortArmors(SortOption? option) async {
    setState(() {
      if (option == SortOption.name) {
        setState(() {
          displayedArmors = armors;
          displayedArmors.sort((a, b) => a.name.compareTo(b.name));
        });
      } else if (option == SortOption.weight) {
        setState(() {
          displayedArmors = armors;
          displayedArmors.sort((a, b) => a.weight.compareTo(b.weight));
        });
      }
    });
  }
}

class armorsSearch extends SearchDelegate<ArmorSet> {
  final List<ArmorSet> armors;
  final Function(List<ArmorSet>) onArmorsSelected;

  armorsSearch(this.armors, this.onArmorsSelected);

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
      icon: Icon(Icons.arrow_circle_left_outlined,
          color: Theme.of(context).colorScheme.onSurface),
      onPressed: () {
        close(
            context,
            ArmorSet(
                name: "",
                image: '',
                damageNegation: DamageNegation(),
                weight: -1));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = armors
        .where(
            (armor) => armor.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onArmorsSelected(results);
    });

    return _buildSuggestionList(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? armors
        : armors
            .where((armor) =>
                armor.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return _buildSuggestionList(suggestionList);
  }

  Widget _buildSuggestionList(List<ArmorSet> suggestionList) {
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].name),
          onTap: () {
            onArmorsSelected([suggestionList[index]]);
            close(context, suggestionList[index]);
          },
        );
      },
    );
  }
}

enum SortOption { name, weight }
