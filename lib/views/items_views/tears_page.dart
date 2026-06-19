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

/// Page listing Tears (flasks) with search and sorting.
/// @param isDlc Whether to list DLC tears.
class TearsPage extends StatefulWidget {
  final bool isDlc;
  const TearsPage({super.key, required this.isDlc});

  @override
  State<TearsPage> createState() => _TearsPageState();
}

/// State for TearsPage.
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
    initTearsFuture = initTears();
    futureFoundTears = Future.value([]);
  }

  /// Initialize stored id and user's found tears.
  /// @return Future<void>
  Future<void> initTears() async {
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
          return buildMainWidget(context);
        } else {
          return const LoadingScreen();
        }
      },
    );
  }

  /// Build main scaffold and handle back navigation.
  /// @param context BuildContext
  /// @return Widget
  Widget buildMainWidget(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (result) {
        if (displayedTears.length == tears.length) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(isDlc: widget.isDlc),
            ),
          );
        } else {
          setState(() {
            displayedTears = tears;
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
                    title: Text('Sort by:'.tr),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text('Default'.tr),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.defaultSort;
                              sortTals(SortOption.defaultSort);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          title: Text('Name'.tr),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.name;
                              sortTals(SortOption.name);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          title: Text('Not Found'.tr),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.notFound;
                              sortTals(SortOption.notFound);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Icon(
              Icons.sort,
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
          ),
        ),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.arrow_circle_left_outlined,
                color: Theme.of(context).colorScheme.onSurface,
              ),
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
        body: displayedTears.isEmpty
            ? Center(
                child: Text(
                  "Nothing to display".toUpperCase(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 20,
                    fontFamily: 'Mantinia',
                  ),
                ),
              )
            : Center(
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
                                    decoration: BoxDecoration(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.secondaryContainer,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.secondaryContainer,
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(1, 1),
                                        ),
                                      ],
                                    ),
                                    child: CheckboxListTile(
                                      value: snapshot.data!.contains(
                                        displayedTears[index].name,
                                      ),
                                      onChanged: (bool? value) async {
                                        setState(() {
                                          if (value == true) {
                                            if (!snapshot.data!.contains(
                                              displayedTears[index].name,
                                            )) {
                                              snapshot.data!.add(
                                                displayedTears[index].name,
                                              );
                                            }
                                          } else {
                                            if (snapshot.data!.contains(
                                              displayedTears[index].name,
                                            )) {
                                              snapshot.data!.remove(
                                                displayedTears[index].name,
                                              );
                                            }
                                          }
                                        });
                                        if (value!) {
                                          await db.addUserTear(
                                            displayedTears[index].name,
                                            id,
                                          );
                                        } else {
                                          await db.removeUserTear(
                                            displayedTears[index].name,
                                            id,
                                          );
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
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        TearDetailPage(
                                                          tear:
                                                              displayedTears[index],
                                                        ),
                                                  ),
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                child: Image.asset(
                                                  displayedTears[index].image,
                                                ),
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
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
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

  /// Sort tears according to chosen option.
  /// @param option SortOption? option
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
            displayedTears = tears
                .where((tal) => !foundtals.contains(tal.name))
                .toList();
            displayedTears.sort((a, b) => a.name.compareTo(b.name));
          });
        });
      } else if (option == SortOption.defaultSort) {
        // defaultOrder defines curated display order for tears
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
          displayedTears.sort(
            (a, b) => defaultOrder
                .indexOf(a.name)
                .compareTo(defaultOrder.indexOf(b.name)),
          );
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
      icon: Icon(
        Icons.arrow_circle_left_outlined,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      onPressed: () {
        close(
          context,
          Tear(
            name: '',
            image: '',
            mapLink: '',
            effect: "",
            howToFind: "",
            duration: -1,
          ),
        );
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
                (tal) => tal.name.toLowerCase().contains(query.toLowerCase()),
              )
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
