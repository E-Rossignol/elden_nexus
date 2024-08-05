// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:elden_nexus/constants/constant.dart';
import 'package:elden_nexus/firebase/auth/auth.dart';
import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/views/loading_screen.dart';
import 'package:elden_nexus/views/routing_view.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
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
  DatabaseMethods db = DatabaseMethods.instance;
  late List<Armor> armors;
  List<Armor> displayedArmors = [];
  late Future<List<String>> futureFoundArmors;
  SortOption? selectedSortOption;
  late Future<void> initArmorsFuture;

  @override
  void initState() {
    super.initState();
    armors = widget.isDlc ? db.allDBSOTEArmors : db.allDBArmors;
    initArmorsFuture = initArmors();
    futureFoundArmors = db.getUserArmors(Auth().currentUser!.uid);
  }

  Future<void> initArmors() async {
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
      onPopInvoked: (result) {
        if (displayedArmors != armors) {
          setState(() {
            displayedArmors = List.from(armors);
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
                          title: Text('Set'),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.set;
                              sortArmors(SortOption.set);
                            });
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
                        ListTile(
                          title: Text('Armor Piece'),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.type;
                              sortArmors(SortOption.type);
                            });
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
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
                  return Text("", style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 20));
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
                                  onChanged: (bool? value) async {
                                    setState(() {
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
                                    if (value!) {
                                      await db.addUserArmor(
                                          displayedArmors[index].name,
                                          Auth().currentUser!.uid);
                                    } else {
                                      await db.removeUserArmor(
                                          displayedArmors[index].name,
                                          Auth().currentUser!.uid);
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

  void sortArmors(SortOption? option) async {
    setState(() {
      if (option == SortOption.name) {
        setState(() {
          displayedArmors = armors;
          displayedArmors.sort((a, b) => a.name.compareTo(b.name));
        });
      } else if (option == SortOption.set) {
        List<ArmorPiece> pieces = [
          ArmorPiece.helm,
          ArmorPiece.chest,
          ArmorPiece.gauntlets,
          ArmorPiece.leg,
        ];
        displayedArmors = armors.where((element) => !element.name.contains("(altered)")).toList();
        displayedArmors.sort((a,b) {
          int compare = a.set.compareTo(b.set);
          if (compare != 0) return compare;
          return pieces.indexOf(a.armorPiece).compareTo(pieces.indexOf(b.armorPiece));
        });
      }
      else if (option == SortOption.type) {
        List<ArmorPiece> pieces = [
          ArmorPiece.helm,
          ArmorPiece.chest,
          ArmorPiece.gauntlets,
          ArmorPiece.leg,
        ];
        displayedArmors = armors.where((element) => !element.name.contains("(altered)")).toList();
        displayedArmors.sort((a, b) {
          int indexA = pieces.indexOf(a.armorPiece);
          int indexB = pieces.indexOf(b.armorPiece);
          return indexA.compareTo(indexB);
        });
      }
      else if (option == SortOption.notFound) {
        futureFoundArmors.then((foundArmors) {
          setState(() {
            displayedArmors = armors
                .where((armor) => !foundArmors.contains(armor.name))
                .toList();
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
            Armor(
                name: "",
                image: '',
                damageNegation: DamageNegation(),
                armorPiece: ArmorPiece.gauntlets,
                howToFind: '',
                mapLink: '',
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

enum SortOption { name, notFound, set, type }
