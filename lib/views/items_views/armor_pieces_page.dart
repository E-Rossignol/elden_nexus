import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/models/armor_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../constants/constant.dart';
import '../../constants/helper.dart';
import '../../models/armor.dart';
import 'armor_pieces_detail_page.dart';
import 'armor_set_detail_page.dart';

/// Page listing armor pieces for a set, allowing marking pieces as found.
///
/// @param set ArmorSet belonging to these pieces.
/// @param armorPieces List<Armor> pieces for the set.
class ArmorPiecesPage extends StatefulWidget {
  final ArmorSet set;
  final List<Armor> armorPieces;
  const ArmorPiecesPage(
      {super.key, required this.set, required this.armorPieces});

  @override
  State<ArmorPiecesPage> createState() => _ArmorPiecesPageState();
}

/// State for ArmorPiecesPage.
class _ArmorPiecesPageState extends State<ArmorPiecesPage> {
  late Future<List<String>> futureArmors;
  String id = '';
  @override
  void initState() {
    super.initState();
    futureArmors = Future.value([]);
    initDatas();
  }

  /// Initialize user id and fetch user-owned armors.
  /// @return Future<void>
  void initDatas() async {
    id = await const FlutterSecureStorage().read(key: 'id') ?? '';
    futureArmors = DatabaseMethods.instance.getUserArmors(id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (result) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ArmorSetDetailPage(
              armorSet: widget.set,
            ),
          ),
        );
      },
      child: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(widget.set.name.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Mantinia',
                        color: Theme.of(context).colorScheme.onSurface))),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_circle_left_outlined,
                  color: Theme.of(context).colorScheme.onSurface),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArmorSetDetailPage(
                      armorSet: widget.set,
                    ),
                  ),
                );
              },
            ),
          ),
          body: _armorPieces()),
    );
  }

  /// Return a default image path for a missing piece based on piece type.
  /// @param arm Armor to evaluate
  /// @return String path to default image
  String getDefaultImage(Armor arm) {
    switch (arm.armorPiece) {
      case ArmorPiece.helm:
        return "lib/constants/images/app/default_helm.png";
      case ArmorPiece.chest:
        return "lib/constants/images/app/default_chest.png";
      case ArmorPiece.gauntlets:
        return "lib/constants/images/app/default_gauntlet.png";
      case ArmorPiece.greaves:
        return "lib/constants/images/app/default_leg.png";
    }
  }

  /// Build the list view of armor pieces, grouping altered variants and default "no X" entries.
  /// @return Widget
  Widget _armorPieces() {
    Armor helm = Armor(
        name: "No Helm",
        image: "",
        armorPiece: ArmorPiece.helm,
        howToFind: "",
        mapLink: "",
        weight: 0,
        damageNegation: DamageNegation());
    Armor helmAltered = Armor(
        name: "",
        image: "",
        armorPiece: ArmorPiece.helm,
        howToFind: "",
        mapLink: "",
        weight: 0,
        damageNegation: DamageNegation());
    Armor chest = Armor(
        name: "No chest",
        image: "",
        armorPiece: ArmorPiece.chest,
        howToFind: "",
        mapLink: "",
        weight: 0,
        damageNegation: DamageNegation());
    Armor chestAltered = Armor(
        name: "",
        image: "",
        armorPiece: ArmorPiece.chest,
        howToFind: "",
        mapLink: "",
        weight: 0,
        damageNegation: DamageNegation());
    Armor gauntlet = Armor(
        name: "No gauntlet",
        image: "",
        armorPiece: ArmorPiece.gauntlets,
        howToFind: "",
        mapLink: "",
        weight: 0,
        damageNegation: DamageNegation());
    Armor gauntletAltered = Armor(
        name: "",
        image: "",
        armorPiece: ArmorPiece.gauntlets,
        howToFind: "",
        mapLink: "",
        weight: 0,
        damageNegation: DamageNegation());
    Armor greaves = Armor(
        name: "No greaves",
        image: "",
        armorPiece: ArmorPiece.greaves,
        howToFind: "",
        mapLink: "",
        weight: 0,
        damageNegation: DamageNegation());
    Armor greavesAltered = Armor(
        name: "",
        image: "",
        armorPiece: ArmorPiece.greaves,
        howToFind: "",
        mapLink: "",
        weight: 0,
        damageNegation: DamageNegation());

    List<Armor> helmList = widget.armorPieces
        .where((arm) => arm.armorPiece == ArmorPiece.helm)
        .toList();
    List<Armor> chestList = widget.armorPieces
        .where((arm) => arm.armorPiece == ArmorPiece.chest)
        .toList();
    List<Armor> gauntletList = widget.armorPieces
        .where((arm) => arm.armorPiece == ArmorPiece.gauntlets)
        .toList();
    List<Armor> greavesList = widget.armorPieces
        .where((arm) => arm.armorPiece == ArmorPiece.greaves)
        .toList();

    if (helmList.length >= 2) {
      helm = helmList.firstWhere((element) =>
          !element.name.toLowerCase().contains("(altered)".toLowerCase()));
      helmAltered = helmList.elementAt(1);
    } else if (helmList.length == 1) {
      helm = helmList.first;
    }
    if (chestList.length >= 2) {
      chest = chestList.firstWhere((element) =>
          !element.name.toLowerCase().contains("(altered)".toLowerCase()));
      chestAltered = chestList.elementAt(1);
    } else if (chestList.length == 1) {
      chest = chestList.first;
    }
    if (gauntletList.length >= 2) {
      gauntlet = gauntletList.firstWhere((element) =>
          !element.name.toLowerCase().contains("(altered)".toLowerCase()));
      gauntletAltered = gauntletList.elementAt(1);
    } else if (gauntletList.length == 1) {
      gauntlet = gauntletList.first;
    }
    if (greavesList.length >= 2) {
      greaves = greavesList.firstWhere((element) =>
          !element.name.toLowerCase().contains("(altered)".toLowerCase()));
      greavesAltered = greavesList.elementAt(1);
    } else if (greavesList.length == 1) {
      greaves = greavesList.first;
    }

    List<Armor> displayedArmors = [];
    displayedArmors.add(helm);
    displayedArmors.addIf(helmAltered.name != "", helmAltered);
    displayedArmors.add(chest);
    displayedArmors.addIf(chestAltered.name != "", chestAltered);
    displayedArmors.add(gauntlet);
    displayedArmors.addIf(gauntletAltered.name != "", gauntletAltered);
    displayedArmors.add(greaves);
    displayedArmors.addIf(greavesAltered.name != "", greavesAltered);
    displayedArmors.sort((a, b) {
      if (a.name.contains('altered') && !b.name.contains('altered')) {
        return 1;
      } else if (!a.name.contains('altered') && b.name.contains('altered')) {
        return -1;
      } else {
        return 0;
      }
    });

    return FutureBuilder(
      future: futureArmors,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          DatabaseMethods db = DatabaseMethods.instance;

          return Scrollbar(
            thickness: 10,
            interactive: true,
            thumbVisibility: true,
            child: ListView.builder(
              itemCount: displayedArmors.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: displayedArmors[index].name.contains('altered')
                          ? Helper.darkenColor(Theme.of(context)
                              .colorScheme
                              .secondaryContainer)
                          : Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(1, 1),
                        ),
                      ],
                    ),
                    child: CheckboxListTile(
                      enabled: displayedArmors[index].weight != 0,
                      value: snapshot.data!
                          .contains(displayedArmors[index].name),
                      onChanged: (bool? value) async {
                        setState(() {
                          if (value == true) {
                            if (!snapshot.data!
                                .contains(displayedArmors[index].name)) {
                              snapshot.data!.add(displayedArmors[index].name);
                            }
                          } else {
                            if (snapshot.data!
                                .contains(displayedArmors[index].name)) {
                              snapshot.data!
                                  .remove(displayedArmors[index].name);
                            }
                          }
                        });
                        if (value!) {
                          await db.addUserArmor(
                              displayedArmors[index].name, id);
                        } else {
                          await db.removeUserArmor(
                              displayedArmors[index].name, id);
                        }
                      },
                      title: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.info_outline,
                                color: displayedArmors[index].weight != 0
                                    ? Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer
                                    : Colors.blueGrey,
                              ),
                              onPressed: displayedArmors[index].weight != 0
                                  ? () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ArmorPiecesDetailPage(
                                                  armor:
                                                      displayedArmors[index]),
                                        ),
                                      );
                                    }
                                  : null,
                            ),
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                    displayedArmors[index].image != ""
                                        ? displayedArmors[index].image
                                        : getDefaultImage(
                                            displayedArmors[index])),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  displayedArmors[index].name,
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
          );
        } else {
          return SpinKitSpinningLines(
            color: Theme.of(context).colorScheme.primary,
            size: 50.0,
          );
        }
      },
    );
  }
}
