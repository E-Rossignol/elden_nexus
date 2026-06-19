// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/models/ash_of_war.dart';
import 'package:elden_nexus/views/loading_screen.dart';
import 'package:elden_nexus/views/routing_view.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../home_page.dart';
import 'ashes_of_war_detail_page.dart';

/// Page that lists Ashes of War and supports sorting and marking found.
/// @param isDlc Whether to use DLC list.
class AshesOfWarPage extends StatefulWidget {
  final bool isDlc;
  const AshesOfWarPage({super.key, required this.isDlc});

  @override
  State<AshesOfWarPage> createState() => _AshesOfWarPageState();
}

/// State for AshesOfWarPage.
class _AshesOfWarPageState extends State<AshesOfWarPage> {
  DatabaseMethods db = DatabaseMethods.instance;
  late List<AshOfWar> ashes;
  List<AshOfWar> displayedAshes = [];
  late Future<List<String>> futureFoundAshes;
  SortOption? selectedSortOption;
  late Future<void> initAshesFuture;
  late String id = '';

  @override
  void initState() {
    super.initState();
    ashes = widget.isDlc ? db.allDBSOTEAshesOfWar : db.allDBAshesOfWar;
    initAshesFuture = initAshes();
    futureFoundAshes = Future.value([]);
  }

  /// Initialize user id, found ashes and default sort by affinity.
  /// @return Future<void>
  Future<void> initAshes() async {
    id = await FlutterSecureStorage().read(key: 'id') ?? '';
    futureFoundAshes = db.getUserAshes(id);
    displayedAshes = List.from(ashes);
    sortAshes(SortOption.affinity);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initAshesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return buildMainWidget(context);
        } else {
          return const LoadingScreen();
        }
      },
    );
  }

  /// Build main scaffold and manage back behavior.
  Widget buildMainWidget(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (result) {
        if (displayedAshes.length == ashes.length) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(isDlc: widget.isDlc),
            ),
          );
        } else {
          setState(() {
            displayedAshes = ashes;
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
                          title: Text('Affinity'.tr),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.affinity;
                              sortAshes(SortOption.affinity);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          title: Text('Name'.tr),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.name;
                              sortAshes(SortOption.name);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          title: Text('Not Found'.tr),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.notFound;
                              sortAshes(SortOption.notFound);
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
                  return const Text("");
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
                                  displayedAshes[index].name,
                                ),
                                onChanged: (bool? value) async {
                                  setState(() {
                                    if (value == true) {
                                      if (!snapshot.data!.contains(
                                        displayedAshes[index].name,
                                      )) {
                                        snapshot.data!.add(
                                          displayedAshes[index].name,
                                        );
                                      }
                                    } else {
                                      if (snapshot.data!.contains(
                                        displayedAshes[index].name,
                                      )) {
                                        snapshot.data!.remove(
                                          displayedAshes[index].name,
                                        );
                                      }
                                    }
                                  });
                                  if (value!) {
                                    await db.addUserAsh(
                                      displayedAshes[index].name,
                                      id,
                                    );
                                  } else {
                                    await db.removeUserAsh(
                                      displayedAshes[index].name,
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
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onSecondaryContainer,
                                        ),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AshOfWarDetailPage(
                                                    ash: displayedAshes[index],
                                                  ),
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            25,
                                          ),
                                          child: Image.asset(
                                            displayedAshes[index].image,
                                          ),
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

  /// Sort ashes according to chosen option.
  /// @param option SortOption? option to apply
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
            displayedAshes = ashes
                .where((ash) => !foundAshes.contains(ash.name))
                .toList();
            displayedAshes.sort((a, b) => a.name.compareTo(b.name));
          });
        });
      } else if (option == SortOption.affinity) {
        List<String> affinities = [
          "Heavy",
          "Keen",
          "Quality",
          "Magic",
          "Fire",
          "Flame Art",
          "Lightning",
          "Sacred",
          "Poison",
          "Blood",
          "Cold",
          "Occult",
          "Standard",
        ];
        displayedAshes = ashes;
        displayedAshes.sort((a, b) => a.name.compareTo(b.name));
        displayedAshes.sort((a, b) {
          return affinities
              .indexOf(a.affinity)
              .compareTo(affinities.indexOf(b.affinity));
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
      icon: Icon(
        Icons.arrow_circle_left_outlined,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      onPressed: () {
        close(
          context,
          AshOfWar(
            name: '',
            image: '',
            description: '',
            howToFind: '',
            mapLink: '',
            usableOn: '',
            affinity: '',
          ),
        );
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
                (ash) => ash.name.toLowerCase().contains(query.toLowerCase()),
              )
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

enum SortOption { name, notFound, affinity }
