// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/models/incantation.dart';
import 'package:elden_nexus/views/loading_screen.dart';
import 'package:elden_nexus/views/routing_view.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../constants/constant.dart';
import '../home_page.dart';
import 'incantations_detail_page.dart';

class IncantationsPage extends StatefulWidget {
  final bool isDlc;
  const IncantationsPage({super.key, required this.isDlc});

  @override
  State<IncantationsPage> createState() => _IncantationsPageState();
}

class _IncantationsPageState extends State<IncantationsPage> {
  DatabaseMethods db = DatabaseMethods.instance;
  late List<Incantation> incants;
  List<Incantation> displayedIncants = [];
  late Future<List<String>> futureFoundIncants;
  SortOption? selectedSortOption;
  late Future<void> initIncantsFuture;
  late String id = '';

  @override
  void initState() {
    super.initState();
    incants = widget.isDlc ? db.allDBSOTEIncantations : db.allDBIncantations;
    initIncantsFuture = initIncants();
    futureFoundIncants = Future.value([]);
  }

  Future<void> initIncants() async {
    id = await FlutterSecureStorage().read(key: 'id') ?? '';
    futureFoundIncants = db.getUserIncantations(id);
    displayedIncants = List.from(incants);
    sortIncants(SortOption.type);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initIncantsFuture,
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
      onPopInvoked: (result) {
        if (displayedIncants.length == incants.length) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(isDlc: widget.isDlc),
            ),
          );
        } else {
          setState(() {
            displayedIncants = incants;
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
                              sortIncants(SortOption.type);
                            });
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
                        ListTile(
                          title: Text('Name'.tr),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.name;
                              sortIncants(SortOption.name);
                            });
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
                        ListTile(
                          title: Text('Not Found'.tr),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.notFound;
                              sortIncants(SortOption.notFound);
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
                color: Theme.of(context).colorScheme.secondary),
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
              future: futureFoundIncants,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    '${incants.where((inc) => snapshot.data!.contains(inc.name)).toList().length}/${incants.length}',
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
                  delegate: IncantsSearch(incants, (selectedIncants) {
                    setState(() {
                      displayedIncants = selectedIncants;
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
                future: futureFoundIncants,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                      child: Scrollbar(
                        thickness: 10,
                        interactive: true,
                        thumbVisibility: true,
                        child: ListView.builder(
                          itemCount: displayedIncants.length,
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
                                      .contains(displayedIncants[index].name),
                                  onChanged: (bool? value) async {
                                    setState(() {
                                      if (value == true) {
                                        if (!snapshot.data!.contains(
                                            displayedIncants[index].name)) {
                                          snapshot.data!.add(
                                              displayedIncants[index].name);
                                        }
                                      } else {
                                        if (snapshot.data!.contains(
                                            displayedIncants[index].name)) {
                                          snapshot.data!.remove(
                                              displayedIncants[index].name);
                                        }
                                      }
                                    });
                                    if (value!) {
                                      await db.addUserIncantation(
                                          displayedIncants[index].name, id);
                                    } else {
                                      await db.removeUserIncantation(
                                          displayedIncants[index].name, id);
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
                                                    IncantationDetailPage(
                                                        incant:
                                                            displayedIncants[
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
                                                displayedIncants[index].image),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              displayedIncants[index].name,
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

  void sortIncants(SortOption? option) async {
    setState(() {
      if (option == SortOption.name) {
        setState(() {
          displayedIncants = incants;
          displayedIncants.sort((a, b) => a.name.compareTo(b.name));
        });
      } else if (option == SortOption.notFound) {
        futureFoundIncants.then((foundIncants) {
          setState(() {
            displayedIncants = incants
                .where((inc) => !foundIncants.contains(inc.name))
                .toList();
            displayedIncants.sort((a, b) => a.name.compareTo(b.name));
          });
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
        displayedIncants = incants;
        displayedIncants.sort((a, b) {
          int indexA = types.indexOf(a.element);
          int indexB = types.indexOf(b.element);
          return indexA.compareTo(indexB);
        });
      }
    });
  }
}

class IncantsSearch extends SearchDelegate<Incantation> {
  final List<Incantation> incants;
  final Function(List<Incantation>) onIncantsSelected;

  IncantsSearch(this.incants, this.onIncantsSelected);

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
            Incantation(
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
    final results = incants
        .where((inc) => inc.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onIncantsSelected(results);
    });

    return _buildSuggestionList(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? incants
        : incants
            .where(
                (inc) => inc.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return _buildSuggestionList(suggestionList);
  }

  Widget _buildSuggestionList(List<Incantation> suggestionList) {
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].name),
          onTap: () {
            onIncantsSelected([suggestionList[index]]);
            close(context, suggestionList[index]);
          },
        );
      },
    );
  }
}

enum SortOption { name, notFound, type }
