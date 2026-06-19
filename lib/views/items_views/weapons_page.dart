import 'dart:async';
import 'package:elden_nexus/constants/constant.dart';
import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/views/routing_view.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../constants/helper.dart';
import '../../models/weapon.dart';
import '../home_page.dart';
import '../loading_screen.dart';
import 'weapons_detail_page.dart';
import 'package:get/get.dart';

/// Page listing Weapons with filtering by category, sorting and search.
///
/// @param isDlc Whether to show DLC weapons.
class WeaponsPage extends StatefulWidget {
  final bool isDlc;

  const WeaponsPage({super.key, required this.isDlc});

  @override
  State<WeaponsPage> createState() => _WeaponsPageState();
}

/// State for WeaponsPage.
class _WeaponsPageState extends State<WeaponsPage> {
  DatabaseMethods db = DatabaseMethods.instance;
  late List<Weapon> weapons;
  List<Weapon> displayedWeapons = [];
  late Future<List<String>> futureFoundWeapons;
  WeaponCategory? selectedWeaponCategory;
  SortOption? selectedSortOption;
  late Future<void> initWeaponsFuture;
  late String id = "";

  @override
  void initState() {
    super.initState();
    weapons = widget.isDlc ? db.allDBSOTEWeapons : db.allDBWeapons;
    initWeaponsFuture = initWeapons();
    futureFoundWeapons = Future.value([]);
  }

  /// Initialize stored id and user's found weapons.
  /// @return Future<void>
  Future<void> initWeapons() async {
    id = await FlutterSecureStorage().read(key: 'id') ?? '';
    futureFoundWeapons = db.getUserWeapons(id);
    displayedWeapons = List.from(weapons);
    sortWeapons(SortOption.defaultSort);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initWeaponsFuture,
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
  /// @param context BuildContext
  /// @return Widget
  Widget buildMainWidget(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (result) {
        if (displayedWeapons.length == weapons.length) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(isDlc: widget.isDlc),
            ),
          );
        } else {
          setState(() {
            displayedWeapons = weapons;
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
                              sortWeapons(SortOption.defaultSort);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          title: Text('Not Found'.tr),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.notFound;
                              sortWeapons(SortOption.notFound);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          title: Text('Name'.tr),
                          onTap: () {
                            setState(() {
                              selectedSortOption = SortOption.name;
                              sortWeapons(SortOption.name);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          title: Text('Weapon Category'.tr),
                          onTap: () {
                            Navigator.of(context).pop();
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Weapon Category'.tr),
                                  content: DropdownButton<WeaponCategory>(
                                    hint: Text('Category'.tr),
                                    value: selectedWeaponCategory,
                                    items: WeaponCategory.values.map((option) {
                                      return DropdownMenuItem<WeaponCategory>(
                                        value: option,
                                        child: Text(Helper.strCat(option)),
                                      );
                                    }).toList(),
                                    onChanged: (option) {
                                      setState(() {
                                        selectedSortOption =
                                            SortOption.category;
                                        selectedWeaponCategory = option;
                                        filterWeaponsByCategory(option);
                                      });
                                      Navigator.of(context)
                                          .pop();
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
                  return const Text("");
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
                                      .contains(displayedWeapons[index].name),
                                  onChanged: (bool? value) async {
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
                                    if (value!) {
                                      await db.addUserWeapon(
                                          displayedWeapons[index].name, id);
                                    } else {
                                      await db.removeUserWeapon(
                                          displayedWeapons[index].name, id);
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

  /// Sort weapons by category/name/default/not found.
  /// Category order is defined to provide consistent grouping for weapon types.
  /// @param option SortOption? option
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

  /// Filter weapons by a specific category.
  /// @param category WeaponCategory? category to filter by
  void filterWeaponsByCategory(WeaponCategory? category) {
    setState(() {
      if (category == null) {
        displayedWeapons = List.from(weapons);
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
      icon: Icon(Icons.arrow_circle_left_outlined,
          color: Theme.of(context).colorScheme.onSurface),
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
                weapon.name.toLowerCase().contains(query.toLowerCase()))
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
