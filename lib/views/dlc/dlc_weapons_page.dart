import 'package:elden_nexus/constants/constant.dart';
import 'package:elden_nexus/firebase/auth/auth.dart';
import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/views/routing_view.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import '../../constants/helper.dart';
import '../../models/weapon.dart';
import '../detail_page.dart';

class DlcWeaponsPage extends StatefulWidget {
  const DlcWeaponsPage({super.key});

  @override
  State<DlcWeaponsPage> createState() => _DlcWeaponsPageState();
}

class _DlcWeaponsPageState extends State<DlcWeaponsPage> {
  DatabaseMethods db = DatabaseMethods();
  List<Weapon> weapons = allDlcWeapons();
  List<Weapon> displayedWeapons = [];
  late Future<List<String>> futureFoundWeapons;
  WeaponCategory? selectedWeaponCategory;
  Location? selectedLocation;
  SortOption? selectedSortOption;

  @override
  void initState() {
    futureFoundWeapons = db.getUserWeapons(Auth().currentUser!.uid);
    super.initState();
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
                      ListTile(
                        title: Text('Location'),
                        onTap: () {
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Location'),
                                content: DropdownButton<Location>(
                                  hint: Text('Location'),
                                  value: selectedLocation,
                                  items: Location.values
                                      .map((option) {
                                        if (Helper.isDLCLoc(option)) {
                                          return DropdownMenuItem<Location>(
                                            value: option,
                                            child: Text(Helper.strLoc(option)),
                                          );
                                        }
                                      })
                                      .where((item) => item != null)
                                      .toList()
                                      .cast<DropdownMenuItem<Location>>(),
                                  onChanged: (option) {
                                    setState(() {
                                      selectedSortOption = SortOption.location;
                                      selectedLocation = option;
                                      filterWeaponsByLocation(option);
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
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu_rounded),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          title: Text(getSortOptionName()),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: WeaponSearch(weapons),
                );
              },
            ),
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.save),
                onPressed: () async {
                  List<String> toStoreWeapons = await futureFoundWeapons;
                  await db.saveUserWeapons(
                      toStoreWeapons, Auth().currentUser!.uid);
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
                                  onChanged: (bool? value) {
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
                                                    DetailPage(
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
      case SortOption.location:
        return Helper.strLoc(selectedLocation!);
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
      WeaponCategory.straight_sword,
      WeaponCategory.greatsword,
      WeaponCategory.colossal_sword,
      WeaponCategory.thrusting_sword,
      WeaponCategory.heavy_thrusting_sword,
      WeaponCategory.curved_sword,
      WeaponCategory.curved_greatsword,
      WeaponCategory.katana,
      WeaponCategory.twinblade,
      WeaponCategory.axe,
      WeaponCategory.great_axe,
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
      WeaponCategory.claw,
      WeaponCategory.light_bow,
      WeaponCategory.bow,
      WeaponCategory.great_bow,
      WeaponCategory.crossbow,
      WeaponCategory.ballista,
      WeaponCategory.glintstone_staff,
      WeaponCategory.sacred_seal,
      WeaponCategory.torch,
      WeaponCategory.thrusting_shield,
      WeaponCategory.hand_to_hand_art,
      WeaponCategory.throwing_blade,
      WeaponCategory.backhand_blade,
      WeaponCategory.perfume_bottle,
      WeaponCategory.beast_claw,
      WeaponCategory.light_greatsword,
      WeaponCategory.great_katana,
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
          displayedWeapons = allDlcWeapons();
          displayedWeapons.sort((a, b) => a.name.compareTo(b.name));
        });
      } else if (option == SortOption.location) {
        displayedWeapons.sort((a, b) =>
            Helper.strLoc(a.location).compareTo(Helper.strLoc(b.location)));
      } else if (option == SortOption.defaultSort) {
        setState(() {
          displayedWeapons = allDlcWeapons();
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
            displayedWeapons.sort((a, b) => a.name.compareTo(b.name));
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

  void filterWeaponsByLocation(Location? location) {
    setState(() {
      if (location == null) {
        displayedWeapons = List.from(
            weapons); // If no location is selected, display all weapons
      } else {
        displayedWeapons =
            weapons.where((weapon) => weapon.location == location).toList();
      }
    });
  }
}

class WeaponSearch extends SearchDelegate<Weapon> {
  final List<Weapon> weapons;

  WeaponSearch(this.weapons);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(
            context,
            Weapon(
                name: '',
                image: '',
                location: Location.ainsel_river,
                weaponCategory: WeaponCategory.axe,
                howToFind: '',
                infos: [],
            isSomber: false));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSuggestionList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSuggestionList();
  }

  Widget _buildSuggestionList() {
    final suggestionList = query.isEmpty
        ? weapons
        : weapons
            .where((weapon) =>
                weapon.name.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].name),
          onTap: () {
            close(context, suggestionList[index]);
            showDialog(
                context: context,
                builder: (context) {
                  return DetailPage(weapon: suggestionList[index]);
                });
          },
        );
      },
    );
  }
}

enum SortOption { category, name, location, defaultSort, notFound }
