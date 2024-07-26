import 'dart:async';

import 'package:elden_nexus/constants/constant.dart';
import 'package:elden_nexus/firebase/auth/auth.dart';
import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/views/loading_screen.dart';
import 'package:elden_nexus/views/routing_view.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/helper.dart';
import '../../models/armor.dart';
import '../home_page.dart';
import 'armors_detail_page.dart';

class ArmorsPage extends StatefulWidget {
  final bool isDlc;

  const ArmorsPage({super.key, required this.isDlc});

  @override
  State<ArmorsPage> createState() => _ArmorsPageState();
}

class _ArmorsPageState extends State<ArmorsPage> {
  DatabaseMethods db = DatabaseMethods();
  late List<Armor> armors;
  List<Armor> displayedArmors = [];
  late Future<List<String>> futureFoundArmors;
  SortOption? selectedSortOption;
  late Future<void> initArmorsFuture;
  bool isSaving = false;
  bool isSaved = false;
  Timer? saveTimer;

  @override
  void initState() {
    super.initState();
    initArmorsFuture = initArmors();
    futureFoundArmors = db.getUserArmors(Auth().currentUser!.uid);
  }

  Future<void> initArmors() async {
    armors = (await db.getAllArmors(widget.isDlc))!;
    futureFoundArmors = db.getUserArmors(Auth().currentUser!.uid);
    displayedArmors = List.from(armors);
    sortArmors(SortOption.name);
  }

  void setFoundArmors() async {
    futureFoundArmors = db.getUserArmors(Auth().currentUser!.uid);
    displayedArmors = List.from(armors);
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
      canPop: true,
      onPopInvoked: (context) {
        if (displayedArmors != armors) {
          setState(() {
            displayedArmors = List.from(armors);
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
                            sortArmors(SortOption.name);
                          });
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                      ListTile(
                        title: Text('Not Found'),
                        onTap: () {
                          setState(() {
                            selectedSortOption = SortOption.notFound;
                            sortArmors(SortOption.notFound);
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
                child: Builder(builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(isDlc: widget.isDlc),
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
              future: futureFoundArmors,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    '${armors.where((armor) => snapshot.data!.contains(armor.name)).toList().length}/${armors.length}',
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
                  List<String> toStoreArmors = await futureFoundArmors;
                  await db.saveUserArmors(
                      toStoreArmors, Auth().currentUser!.uid);
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
                future: futureFoundArmors,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                      child: Scrollbar(
                        thickness: 10,
                        interactive: true,
                        thumbVisibility: true,
                        child: ListView.builder(
                          itemCount: displayedArmors.length,
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
                                      .contains(displayedArmors[index].name),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (saveTimer != null) {
                                        saveTimer!.cancel(); // Cancel the previous timer if it's still running
                                      }
                                      saveTimer = Timer(const Duration(milliseconds: 500), () async {
                                        if (value!) {
                                          await db.addUserArmor(displayedArmors[index].name, Auth().currentUser!.uid);
                                        } else {
                                          await db.removeUserArmor(displayedArmors[index].name, Auth().currentUser!.uid);
                                        }
                                      });
                                      if (value == true) {
                                        if (!snapshot.data!.contains(
                                            displayedArmors[index].name)) {
                                          snapshot.data!
                                              .add(displayedArmors[index].name);
                                        }
                                      } else {
                                        if (snapshot.data!.contains(
                                            displayedArmors[index].name)) {
                                          snapshot.data!.remove(
                                              displayedArmors[index].name);
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
                                                    ArmorDetailPage(
                                                        armor: displayedArmors[
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
                                                displayedArmors[index].image),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
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

  void sortArmors(SortOption? option) async {
    setState(() {
      if (option == SortOption.name) {
        setState(() {
          displayedArmors = armors;
          displayedArmors.sort((a, b) => a.name.compareTo(b.name));
        });
      } else if (option == SortOption.notFound) {
        futureFoundArmors.then((foundArmors) {
          setState(() {
            displayedArmors =
                armors.where((armor) => !foundArmors.contains(armor.name)).toList();
            displayedArmors.sort((a, b) => a.name.compareTo(b.name));
          });
        });
      }
    });
  }
}

class armorsSearch extends SearchDelegate<Armor> {
  final List<Armor> armors;
  final Function(List<Armor>) onArmorsSelected;

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
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(
            context,
        Armor(name: "", image: '', armorPiece: ArmorPiece.arms, howToFind: '', mapLink: '', weight: -1));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = armors
        .where((armor) => armor.name.toLowerCase().contains(query.toLowerCase()))
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
        .where(
            (armor) => armor.name.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return _buildSuggestionList(suggestionList);
  }

  Widget _buildSuggestionList(List<Armor> suggestionList) {
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

enum SortOption { name, notFound }
