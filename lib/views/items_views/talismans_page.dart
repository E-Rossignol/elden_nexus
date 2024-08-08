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
import '../../models/talisman.dart';
import '../home_page.dart';
import 'talismans_detail_page.dart';

class TalismansPage extends StatefulWidget {
  final bool isDlc;
  const TalismansPage({super.key, required this.isDlc});

  @override
  State<TalismansPage> createState() => _TalismansPageState();
}

class _TalismansPageState extends State<TalismansPage> {
  DatabaseMethods db = DatabaseMethods.instance;
  late List<Talisman> tals;
  List<Talisman> displayedTals = [];
  late Future<List<String>> futureFoundTals;
  SortOption? selectedSortOption;
  late Future<void> initTalsFuture;
  late String id = '';

  @override
  void initState() {
    super.initState();
    tals = widget.isDlc ? db.allDBSOTETalismans : db.allDBTalismans;
    initTalsFuture = initTals();
    futureFoundTals = Future.value([]);
  }

  Future<void> initTals() async {
    id = await FlutterSecureStorage().read(key: 'id') ?? '';
    futureFoundTals = db.getUserTalismans(id);
    displayedTals = List.from(tals);
    sortTals(SortOption.defaultSort);
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
      onPopInvoked: (result) {
        if (displayedTals != tals) {
          setState(() {
            displayedTals = List.from(tals);
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
            child: Icon(Icons.sort,
                color: Theme.of(context).colorScheme.secondaryContainer),
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
                                  onChanged: (bool? value) async {
                                    setState(() {
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
                                        if (value!) {
                                          await db.addUserTalisman(
                                              displayedTals[index].name,
                                              id);
                                        } else {
                                          await db.removeUserTalisman(
                                              displayedTals[index].name,
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
      } else if (option == SortOption.defaultSort) {
        List<String> defaultSortOrder = [
          "Crimson Amber Medallion",
          "Crimson Amber Medallion +1",
          "Crimson Amber Medallion +2",
          "Crimson Seed Talisman",
          "Blessed Dew Talisman",
          "Cerulean Amber Medallion",
          "Cerulean Amber Medallion +1",
          "Cerulean Amber Medallion +2",
          "Cerulean Seed Talisman",
          "Viridian Amber Medallion",
          "Viridian Amber Medallion +1",
          "Viridian Amber Medallion +2",
          "Green Turtle Talisman",
          "Arsenal Charm",
          "Arsenal Charm +1",
          "Great-jar's Arsenal",
          "Erdtree's Favor",
          "Erdtree's Favor +1",
          "Erdtree's Favor +2",
          "Radagon's Scarseal",
          "Radagon's Soreseal",
          "Marika's Scarseal",
          "Marika's Soreseal",
          "Starscourge Heirloom",
          "Prosthesis-Wearer Heirloom",
          "Stargazer Heirloom",
          "Two Fingers Heirloom",
          "Dragoncrest Shield Talisman",
          "Dragoncrest Shield Talisman +1",
          "Dragoncrest Shield Talisman +2",
          "Dragoncrest Greatshield Talisman",
          "Spelldrake Talisman",
          "Spelldrake Talisman +1",
          "Spelldrake Talisman +2",
          "Flamedrake Talisman",
          "Flamedrake Talisman +1",
          "Flamedrake Talisman +2",
          "Boltdrake Talisman",
          "Boltdrake Talisman +1",
          "Boltdrake Talisman +2",
          "Haligdrake Talisman",
          "Haligdrake Talisman +1",
          "Haligdrake Talisman +2",
          "Pearldrake Talisman",
          "Pearldrake Talisman +1",
          "Pearldrake Talisman +2",
          "Immunizing Horn Charm",
          "Immunizing Horn Charm +1",
          "Stalwart Horn Charm",
          "Stalwart Horn Charm +1",
          "Clarifying Horn Charm",
          "Clarifying Horn Charm +1",
          "Mottled Necklace",
          "Mottled Necklace +1",
          "Prince Of Death's Pustule",
          "Prince Of Death's Cyst",
          "Dagger Talisman",
          "Curved Sword Talisman",
          "Twinblade Talisman",
          "Axe Talisman",
          "Hammer Talisman",
          "Spear Talisman",
          "Lance Talisman",
          "Claw Talisman",
          "Greatshield Talisman",
          "Arrow's Sting Talisman",
          "Arrow's Reach Talisman",
          "Graven-school Talisman",
          "Graven-mass Talisman",
          "Faithful's Canvas Talisman",
          "Flock's Canvas Talisman",
          "Primal Glintstone Blade",
          "Moon Of Nokstella",
          "Old Lord's Talisman",
          "Radagon Icon",
          "Roar Medallion",
          "Companion Jar",
          "Perfumer's Talisman",
          "Carian Filigreed Crest",
          "Warrior Jar Shard",
          "Shard Of Alexander",
          "Godfrey Icon",
          "Bull-goat's Talisman",
          "Blue Dancer Charm",
          "Magic Scorpion Charm",
          "Fire Scorpion Charm",
          "Lightning Scorpion Charm",
          "Sacred Scorpion Charm",
          "Crucible Scale Talisman",
          "Crucible Feather Talisman",
          "Crucible Knot Talisman",
          "Red-feathered Branchsword",
          "Blue-feathered Branchsword",
          "Ritual Sword Talisman",
          "Ritual Shield Talisman",
          "Assassin's Crimson Dagger",
          "Assassin's Cerulean Dagger",
          "Winged Sword Insignia",
          "Rotten Winged Sword Insignia",
          "Millicent's Prosthesis",
          "Godskin Swaddling Cloth",
          "Kindred Of Rot's Exultation",
          "Lord Of Blood's Exultation",
          "Taker's Cameo",
          "Ancestral Spirit's Horn",
          "Gold Scarab",
          "Silver Scarab",
          "Crepus's Vial",
          "Concealing Veil",
          "Longtail Cat Talisman",
          "Furled Finger's Trick-mirror",
          "Host's Trick-mirror",
          "Shabriri's Woe",
          "Daedicar's Woe",
          "Sacrificial Twig",
          "Entwining Umbilical Cord",

          "Crimson Amber Medallion +3",
          "Cerulean Amber Medallion +3",
          "Viridian Amber Medallion +3",
          "Two-Headed Turtle Talisman",
          "Stalwart Horn Charm +2",
          "Immunizing Horn Charm +2",
          "Clarifying Horn Charm +2",
          "Mottled Necklace +2",
          "Spelldrake Talisman +3",
          "Flamedrake Talisman +3",
          "Boltdrake Talisman +3",
          "Golden Braid",
          "Pearldrake Talisman +3",
          "Crimson Seed Talisman +1",
          "Cerulean Seed Talisman +1",
          "Blessed Blue Dew Talisman",
          "Fine Crucible Feather Talisman",
          "Outer God Heirloom",
          "Shattered Stone Talisman",
          "Two-Handed Sword Talisman",
          "Crusade Insignia",
          "Aged One's Exultation",
          "Arrow's Soaring Sting Talisman",
          "Pearl Shield Talisman",
          "Dried Bouquet",
          "Smithing Talisman",
          "Ailment Talisman",
          "Retaliatory Crossed-Tree",
          "Lacerating Crossed-tree",
          "Sharpshot Talisman",
          "St-Trina's Smile",
          "Talisman of the Dread",
          "Enraged Divine Beast",
          "Beloved Stardust",
          "Talisman of Lord's Bestowal",
          "Verdigris Discus",
          "Rellana's Cameo",
          "Blade of Mercy",
          "Talisman of All Crucibles"
        ];
        setState(() {
          displayedTals = tals;
          displayedTals.sort((a, b) => defaultSortOrder
              .indexOf(a.name)
              .compareTo(defaultSortOrder.indexOf(b.name)));
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
                (tal) => tal.name.toLowerCase().contains(query.toLowerCase()))
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

enum SortOption { name, notFound, defaultSort }
