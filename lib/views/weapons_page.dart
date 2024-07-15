import 'package:elden_nexus/constants/constant.dart';
import 'package:elden_nexus/firebase/auth/auth.dart';
import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/views/routing_view.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import '../constants/helper.dart';
import '../models/weapon.dart';
import 'detail_page.dart';

class WeaponsPage extends StatefulWidget {
  const WeaponsPage({super.key});

  @override
  State<WeaponsPage> createState() => _WeaponsPageState();
}

class _WeaponsPageState extends State<WeaponsPage> {
  DatabaseMethods db = DatabaseMethods();
  List<Weapon> weapons = Helper.getAllWeapons();
  List<Weapon> displayedWeapons = [];
  late Future<List<String>> foundWeapons;
  WeaponCategory? selectedWeaponCategory;
  Location? selectedLocation;
  SortOption? selectedSortOption;

  @override
  void initState() {
    foundWeapons = db.getUserWeapons(Auth().currentUser!.uid);
    super.initState();
    displayedWeapons = List.from(weapons);
    sortWeapons(SortOption.name);
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
                                    Navigator.of(context).pop(); // Close the dialog
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
                                  items: Location.values.map((option) {
                                    return DropdownMenuItem<Location>(
                                      value: option,
                                      child: Text(Helper.strLoc(option)),
                                    );
                                  }).toList(),
                                  onChanged: (option) {
                                    setState(() {
                                      selectedSortOption = SortOption.location;
                                      selectedLocation = option;
                                      filterWeaponsByLocation(option);
                                    });
                                    Navigator.of(context).pop(); // Close the dialog
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
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu_rounded),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            }
          ),
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
            Builder(builder: (context) => IconButton(
              icon: const Icon(Icons.save),
              onPressed: () async {
                List<String> toStoreWeapons = await foundWeapons;
                await db.saveUserWeapons(toStoreWeapons, Auth().currentUser!.uid);
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
                future: foundWeapons,
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
                                  color: Theme.of(context).colorScheme.secondaryContainer,
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
                                child: ListTile(
                                  leading: Checkbox(
                                    value: snapshot.data!.contains(weapons[index].name),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value == true) {
                                          if (!snapshot.data!.contains(weapons[index].name)) {
                                            snapshot.data!.add(weapons[index].name);
                                          }
                                        } else {
                                          if (snapshot.data!
                                              .contains(weapons[index].name)) {
                                            snapshot.data!.remove(weapons[index].name);
                                          }
                                        }
                                      });
                                    },
                                  ),
                                  title: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: ClipRRect(
                                            // Clip the image to make it circular
                                            borderRadius: BorderRadius.circular(25),
                                            child: Image.asset(
                                                displayedWeapons[index].image),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  onTap: () {
                                    showDialog(context: context, builder: (context){
                                      return DetailPage(weapon: displayedWeapons[index]);
                                    });
                                    // Open the item's info
                                    // You can replace this with your own function
                                  },
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
      default:
        return 'No sorting option selected';
    }
  }

  void sortWeapons(SortOption? option) {
    setState(() {
      if (option == SortOption.category) {
        displayedWeapons.sort((a, b) => Helper.strCat(a.weaponCategory).compareTo(Helper.strCat(b.weaponCategory)));
      } else if (option == SortOption.name) {
        setState(() {
          displayedWeapons = Helper.getAllWeapons();
          displayedWeapons.sort((a, b) => a.name.compareTo(b.name));
        });
      } else if (option == SortOption.location) {
        displayedWeapons.sort((a, b) => Helper.strLoc(a.location).compareTo(Helper.strLoc(b.location)));
      }
    });
  }

  void filterWeaponsByCategory(WeaponCategory? category) {
    setState(() {
      if (category == null) {
        displayedWeapons = List.from(weapons); // If no category is selected, display all weapons
      } else {
        displayedWeapons = weapons.where((weapon) => weapon.weaponCategory == category).toList();
      }
    });
  }

  void filterWeaponsByLocation(Location? location) {
    setState(() {
      if (location == null) {
        displayedWeapons = List.from(weapons); // If no location is selected, display all weapons
      } else {
        displayedWeapons = weapons.where((weapon) => weapon.location == location).toList();
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
        close(context, Weapon(name: '', image: '', way: ObtentionWay.buy, location: Location.ainsel_river, weaponCategory: WeaponCategory.axe, howToFind: ''));
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
        : weapons.where((weapon) => weapon.name.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].name),
          onTap: () {
            close(context, suggestionList[index]);
            showDialog(context: context, builder: (context){
              return DetailPage(weapon: suggestionList[index]);
            });
          },
        );
      },
    );
  }
}


enum SortOption {
  category,
  name,
  location,
  notFound,
}