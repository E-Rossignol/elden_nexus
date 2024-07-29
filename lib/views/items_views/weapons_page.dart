// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:elden_nexus/constants/constant.dart';
import 'package:elden_nexus/firebase/auth/auth.dart';
import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/views/routing_view.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import '../../constants/helper.dart';
import '../../models/weapon.dart';
import '../home_page.dart';
import '../loading_screen.dart';
import 'weapons_detail_page.dart';

class WeaponsPage extends StatefulWidget {
  final bool isDlc;

  const WeaponsPage({super.key, required this.isDlc});

  @override
  State<WeaponsPage> createState() => _WeaponsPageState();
}

class _WeaponsPageState extends State<WeaponsPage> {
  DatabaseMethods db = DatabaseMethods();
  late List<Weapon> weapons;
  List<Weapon> displayedWeapons = [];
  late Future<List<String>> futureFoundWeapons;
  WeaponCategory? selectedWeaponCategory;
  SortOption? selectedSortOption;
  late Future<void> initWeaponsFuture;
  bool isSaving = false;
  bool isSaved = false;
  Timer? saveTimer;

  @override
  void initState() {
    super.initState();
    initWeaponsFuture = initWeapons();
    futureFoundWeapons = db.getUserWeapons(Auth().currentUser!.uid);
  }

  Future<void> initWeapons() async {
    weapons = (await db.getAllWeapons(widget.isDlc))!;
    futureFoundWeapons = db.getUserWeapons(Auth().currentUser!.uid);
    displayedWeapons = List.from(weapons);
    sortWeapons(SortOption.defaultSort);
  }

  void setFoundWeapons() async {
    futureFoundWeapons = db.getUserWeapons(Auth().currentUser!.uid);
    displayedWeapons = List.from(weapons);
    sortWeapons(SortOption.defaultSort);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initWeaponsFuture,
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
        if (displayedWeapons != weapons) {
          setState(() {
            displayedWeapons = List.from(weapons);
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
        floatingActionButton: Opacity(
          opacity: 0.8,
          child: FloatingActionButton(
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
                          title: Text('Default'),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.defaultSort;
                              sortWeapons(SortOption.defaultSort);
                            });
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
                        ListTile(
                          title: Text('Not Found'),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.notFound;
                              sortWeapons(SortOption.notFound);
                            });
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
                        ListTile(
                          title: Text('Name'),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.name;
                              sortWeapons(SortOption.name);
                            });
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
                        ListTile(
                          title: Text('Weapon Category'),
                          onTap: () {
                            Navigator.of(context).pop();
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Weapon Category'),
                                  content: DropdownButton<WeaponCategory>(
                                    hint: Text('Category'),
                                    value: selectedWeaponCategory,
                                    items: WeaponCategory.values.map((option) {
                                      return DropdownMenuItem<WeaponCategory>(
                                        value: option,
                                        child: Text(Helper.strCat(option)),
                                      );
                                    }).toList(),
                                    onChanged: (option) {
                                      setState(() {
                                        selectedSortOption = SortOption.category;
                                        selectedWeaponCategory = option;
                                        filterWeaponsByCategory(option);
                                      });
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                  ),
                                );
                              },
                            );
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
          title: Text(getSortOptionName()),
          actions: <Widget>[
            FutureBuilder(
              future: futureFoundWeapons,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    '${weapons.where((weapon) => snapshot.data!.contains(weapon.name)).toList().length}/${weapons.length}',
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
                  delegate: WeaponSearch(weapons, (selectedWeapons) {
                    setState(() {
                      displayedWeapons = selectedWeapons;
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
                        List<String> toStoreWeapons = await futureFoundWeapons;
                        await db.saveUserWeapons(
                            toStoreWeapons, Auth().currentUser!.uid);
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
                future: futureFoundWeapons,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                      child: Scrollbar(
                        thickness: 10,
                        interactive: true,
                        thumbVisibility: true,
                        child: ListView.builder(
                          itemCount: displayedWeapons.length,
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
                                      .contains(displayedWeapons[index].name),
                                  onChanged: (bool? value) async {
                                    if (saveTimer != null) {
                                      saveTimer!.cancel(); // Cancel the previous timer if it's still running
                                    }
                                    saveTimer = Timer(const Duration(milliseconds: 500), () async {
                                      if (value!) {
                                        await db.addUserWeapon(displayedWeapons[index].name, Auth().currentUser!.uid);
                                      } else {
                                        await db.removeUserWeapon(displayedWeapons[index].name, Auth().currentUser!.uid);
                                      }
                                    });
                                    setState(() {
                                      if (value == true) {
                                        if (!snapshot.data!.contains(
                                            displayedWeapons[index].name)) {
                                          snapshot.data!.add(
                                              displayedWeapons[index].name);
                                        }
                                      } else {
                                        if (snapshot.data!.contains(
                                            displayedWeapons[index].name)) {
                                          snapshot.data!.remove(
                                              displayedWeapons[index].name);
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
                                                    WeaponDetailPage(
                                                        weapon:
                                                            displayedWeapons[
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
                                                displayedWeapons[index].image),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              displayedWeapons[index].name,
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

  String getSortOptionName() {
    if (selectedSortOption == null) {
      return '';
    }
    switch (selectedSortOption) {
      case SortOption.name:
        return 'Name';
      case SortOption.category:
        return Helper.strCat(selectedWeaponCategory!);
      case SortOption.defaultSort:
        return 'Default';
      case SortOption.notFound:
        return 'Not Found Yet';
      default:
        return '';
    }
  }

  void sortWeapons(SortOption? option) async {
    List<WeaponCategory> categoryOrder = [
      WeaponCategory.dagger,
      WeaponCategory.throwing_blade,
      WeaponCategory.straight_sword,
      WeaponCategory.light_greatsword,
      WeaponCategory.greatsword,
      WeaponCategory.colossal_sword,
      WeaponCategory.thrusting_sword,
      WeaponCategory.heavy_thrusting_sword,
      WeaponCategory.curved_sword,
      WeaponCategory.curved_greatsword,
      WeaponCategory.backhand_blade,
      WeaponCategory.katana,
      WeaponCategory.great_katana,
      WeaponCategory.twinblade,
      WeaponCategory.axe,
      WeaponCategory.greataxe,
      WeaponCategory.hammer,
      WeaponCategory.flail,
      WeaponCategory.great_hammer,
      WeaponCategory.colossal_weapon,
      WeaponCategory.spear,
      WeaponCategory.great_spear,
      WeaponCategory.halberd,
      WeaponCategory.reaper,
      WeaponCategory.whip,
      WeaponCategory.fist,
      WeaponCategory.hand_to_hand_art,
      WeaponCategory.claw,
      WeaponCategory.beast_claw,
      WeaponCategory.perfume_bottle,
      WeaponCategory.light_bow,
      WeaponCategory.bow,
      WeaponCategory.great_bow,
      WeaponCategory.crossbow,
      WeaponCategory.ballista,
      WeaponCategory.glintstone_staff,
      WeaponCategory.sacred_seal,
      WeaponCategory.torch,
      WeaponCategory.small_shield,
      WeaponCategory.medium_shield,
      WeaponCategory.greatshield,
      WeaponCategory.thrusting_shield
    ];
    setState(() {
      if (option == SortOption.category) {
        displayedWeapons.sort((a, b) {
          int indexA = categoryOrder.indexOf(a.weaponCategory);
          int indexB = categoryOrder.indexOf(b.weaponCategory);
          return indexA.compareTo(indexB);
        });
      } else if (option == SortOption.name) {
        setState(() {
          displayedWeapons = weapons;
          displayedWeapons.sort((a, b) => a.name.compareTo(b.name));
        });
      } else if (option == SortOption.defaultSort) {
        setState(() {
          displayedWeapons = weapons;
          displayedWeapons.sort((a, b) => a.name.compareTo(b.name));
          displayedWeapons.sort((a, b) {
            int indexA = categoryOrder.indexOf(a.weaponCategory);
            int indexB = categoryOrder.indexOf(b.weaponCategory);
            return indexA.compareTo(indexB);
          });
        });
      } else if (option == SortOption.notFound) {
        futureFoundWeapons.then((foundWeapons) {
          setState(() {
            displayedWeapons = weapons
                .where((weapon) => !foundWeapons.contains(weapon.name))
                .toList();
            displayedWeapons.sort((a, b) {
              int indexA = categoryOrder.indexOf(a.weaponCategory);
              int indexB = categoryOrder.indexOf(b.weaponCategory);
              return indexA.compareTo(indexB);
            });
          });
        });
      }
    });
  }

  void filterWeaponsByCategory(WeaponCategory? category) {
    setState(() {
      if (category == null) {
        displayedWeapons = List.from(
            weapons); // If no category is selected, display all weapons
      } else {
        displayedWeapons = weapons
            .where((weapon) => weapon.weaponCategory == category)
            .toList();
      }
    });
  }
}

class WeaponSearch extends SearchDelegate<Weapon> {
  final List<Weapon> weapons;
  final Function(List<Weapon>) onWeaponsSelected;

  WeaponSearch(this.weapons, this.onWeaponsSelected);

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
            Weapon(
                name: '',
                image: '',
                weaponCategory: WeaponCategory.axe,
                howToFind: '',
                scaling: Scaling(),
                requirements: Requirement(),
                weight: -1,
                isSomber: false,
                damages: Damage(),
                ashOfWar: "",
                mapLink: ''));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = weapons
        .where(
            (weapon) => weapon.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onWeaponsSelected(results);
    });

    return _buildSuggestionList(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? weapons
        : weapons
            .where((weapon) =>
                weapon.name.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return _buildSuggestionList(suggestionList);
  }

  Widget _buildSuggestionList(List<Weapon> suggestionList) {
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].name),
          onTap: () {
            onWeaponsSelected([suggestionList[index]]);
            close(context, suggestionList[index]);
          },
        );
      },
    );
  }
}

enum SortOption { category, name, defaultSort, notFound }
