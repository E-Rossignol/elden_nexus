// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/models/sorcery.dart';
import 'package:elden_nexus/views/loading_screen.dart';
import 'package:elden_nexus/views/routing_view.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../constants/constant.dart';
import '../home_page.dart';
import 'sorceries_detail_page.dart';

/// Page that lists Sorceries with search, sort and found marking.
/// @param isDlc Whether to use DLC sorceries list.
class SorceriesPage extends StatefulWidget {
  final bool isDlc;
  const SorceriesPage({super.key, required this.isDlc});

  @override
  State<SorceriesPage> createState() => _SorceriesPageState();
}

/// State for SorceriesPage.
class _SorceriesPageState extends State<SorceriesPage> {
  DatabaseMethods db = DatabaseMethods.instance;
  late List<Sorcery> sorceries;
  List<Sorcery> displayedSorceries = [];
  late Future<List<String>> futureFoundSorceries;
  SortOption? selectedSortOption;
  late Future<void> initSorceriesFuture;
  late String id = '';

  @override
  void initState() {
    super.initState();
    sorceries = widget.isDlc ? db.allDBSOTESorceries : db.allDBSorceries;
    initSorceriesFuture = initSorceries();
    futureFoundSorceries = Future.value([]);
  }

  /// Initialize id and found sorceries; default sort by type.
  Future<void> initSorceries() async {
    id = await FlutterSecureStorage().read(key: 'id') ?? '';
    futureFoundSorceries = db.getUserSorceries(id);
    displayedSorceries = List.from(sorceries);
    sortSorceries(SortOption.type);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initSorceriesFuture,
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
        if (displayedSorceries.length == sorceries.length) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(isDlc: widget.isDlc),
            ),
          );
        } else {
          setState(() {
            displayedSorceries = sorceries;
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
                              selectedSortOption = SortOption.type;
                              sortSorceries(SortOption.type);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          title: Text('Name'.tr),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.name;
                              sortSorceries(SortOption.name);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          title: Text('Not Found'.tr),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.notFound;
                              sortSorceries(SortOption.notFound);
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
                  return const Text("");
                }
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
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
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
                                  onChanged: (bool? value) async {
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
                                    if (value!) {
                                      await db.addUserSorcery(
                                          displayedSorceries[index].name, id);
                                    } else {
                                      await db.removeUserSorcery(
                                          displayedSorceries[index].name, id);
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

  /// Sort sorceries according to option.
  /// @param option SortOption? option
  void sortSorceries(SortOption? option) async {
    setState(() {
      if (option == SortOption.name) {
        setState(() {
          displayedSorceries = sorceries;
          displayedSorceries.sort((a, b) => a.name.compareTo(b.name));
        });
      } else if (option == SortOption.type) {
        List<SpellType> types = [
          SpellType.physical,
          SpellType.fire,
          SpellType.holy,
          SpellType.magic,
          SpellType.lightning,
          SpellType.heal,
          SpellType.aura_buff,
          SpellType.body_buff,
          SpellType.unique_buff,
          SpellType.utility_spell
        ];
        displayedSorceries = sorceries;
        displayedSorceries.sort((a, b) {
          int indexA = types.indexOf(a.element);
          int indexB = types.indexOf(b.element);
          return indexA.compareTo(indexB);
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
      icon: Icon(Icons.arrow_circle_left_outlined,
          color: Theme.of(context).colorScheme.onSurface),
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
                element: SpellType.physical,
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
            .where(
                (sorc) => sorc.name.toLowerCase().contains(query.toLowerCase()))
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

enum SortOption { name, notFound, type }
