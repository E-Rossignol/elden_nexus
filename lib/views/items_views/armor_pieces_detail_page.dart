import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/models/armor_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../constants/constant.dart';
import '../../models/armor.dart';
import 'armor_detail_page.dart';
import 'armors_set_detail_page.dart';

class ArmorPiecesDetailPage extends StatefulWidget {
  final ArmorSet set;
  final List<Armor> armorPieces;
  const ArmorPiecesDetailPage({super.key, required this.set, required this.armorPieces});

  @override
  State<ArmorPiecesDetailPage> createState() => _ArmorPiecesDetailPageState();
}

class _ArmorPiecesDetailPageState extends State<ArmorPiecesDetailPage> {
  late Future<List<String>> futureArmors;
  String id = '';
  @override
void initState() {
    super.initState();
    futureArmors = Future.value([]);
    initDatas();
  }

  void initDatas() async {
    id = await const FlutterSecureStorage().read(key: 'id') ?? '';
    futureArmors = DatabaseMethods.instance.getUserArmors(id);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.set.name)),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArmorSetDetailPage(
                      armor: widget.set,
                      armorPieces: widget.armorPieces,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: _armorPieces());
  }

  String getDefaultImage(Armor arm){
    switch(arm.armorPiece){
      case ArmorPiece.helm:
        return "lib/constants/images/app/default_helm.png";
      case ArmorPiece.chest:
        return "lib/constants/images/app/default_chest.png";
      case ArmorPiece.gauntlets:
        return "lib/constants/images/app/default_gauntlet.png";
      case ArmorPiece.leg:
        return "lib/constants/images/app/default_leg.png";
    }
  }

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
    Armor leg = Armor(
        name: "No leg",
        image: "",
        armorPiece: ArmorPiece.leg,
        howToFind: "",
        mapLink: "",
        weight: 0,
        damageNegation: DamageNegation());
    Armor legAltered = Armor(
        name: "",
        image: "",
        armorPiece: ArmorPiece.leg,
        howToFind: "",
        mapLink: "",
        weight: 0,
        damageNegation: DamageNegation());

    List<Armor> helmList = widget.armorPieces.where((arm) => arm.armorPiece == ArmorPiece.helm).toList();
    List<Armor> chestList = widget.armorPieces.where((arm) => arm.armorPiece == ArmorPiece.chest).toList();
    List<Armor> gauntletList = widget.armorPieces.where((arm) => arm.armorPiece == ArmorPiece.gauntlets).toList();
    List<Armor> legList = widget.armorPieces.where((arm) => arm.armorPiece == ArmorPiece.leg).toList();

    if (helmList.length >= 2) {
      helm = helmList.firstWhere((element) => !element.name.toLowerCase().contains("(altered)".toLowerCase()));
      helmAltered = helmList.elementAt(1);
    }
    else if (helmList.length == 1){
      helm = helmList.first;
    }
    if (chestList.length >= 2) {
      chest = chestList.firstWhere((element) => !element.name.toLowerCase().contains("(altered)".toLowerCase()));
      chestAltered = chestList.elementAt(1);
    }
    else if (chestList.length == 1){
      chest = chestList.first;
    }
    if (gauntletList.length >= 2) {
      gauntlet = gauntletList.firstWhere((element) => !element.name.toLowerCase().contains("(altered)".toLowerCase()));
      gauntletAltered = gauntletList.elementAt(1);
    }
    else if (gauntletList.length == 1){
      gauntlet = gauntletList.first;
    }
    if (legList.length >= 2) {
      leg = legList.firstWhere((element) => !element.name.toLowerCase().contains("(altered)".toLowerCase()));
      legAltered = legList.elementAt(1);
    }
    else if (legList.length == 1){
      leg = legList.first;
    }

    List<Armor> displayedArmors = [];
    displayedArmors.add(helm);
    displayedArmors.addIf(helmAltered.name != "", helmAltered);
    displayedArmors.add(chest);
    displayedArmors.addIf(chestAltered.name != "", chestAltered);
    displayedArmors.add(gauntlet);
    displayedArmors.addIf(gauntletAltered.name != "", gauntletAltered);
    displayedArmors.add(leg);
    displayedArmors.addIf(legAltered.name != "", legAltered);
    return FutureBuilder(
      future: futureArmors,
      builder: (context, snapshot) {
        {
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
                        enabled: displayedArmors[index].weight != 0,
                        value: snapshot.data!
                            .contains(displayedArmors[index].name),
                        onChanged: (bool? value) async {
                          setState(() {
                            if (value == true) {
                              if (!snapshot.data!.contains(
                                  displayedArmors[index].name)) {
                                snapshot.data!
                                    .add(displayedArmors[index].name);
                              }
                            } else {
                              if (snapshot.data!.contains(
                                  displayedArmors[index].name)) {
                                snapshot.data!.remove(
                                    displayedArmors[index].name);
                              }
                            }
                          });
                          if (value!) {
                            await db.addUserArmor(
                                displayedArmors[index].name,
                                id);
                          } else {
                            await db.removeUserArmor(
                                displayedArmors[index].name,
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
                                  color: displayedArmors[index].weight != 0 ? Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer : Colors.blueGrey,
                                ),
                                onPressed: displayedArmors[index].weight != 0 ? (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ArmorDetailPage(
                                              armor: displayedArmors[
                                              index], armorSet: widget.set),
                                    ),
                                  );
                                } : null,
                              ),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: ClipRRect(
                                  // Clip the image to make it circular
                                  borderRadius:
                                  BorderRadius.circular(25),
                                  child: Image.asset( displayedArmors[index].image != "" ? displayedArmors[index].image : getDefaultImage(displayedArmors[index])),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    displayedArmors[index].name,
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
            );
          } else {
            return SpinKitSpinningLines(
              color: Theme.of(context).colorScheme.primary,
              size: 50.0,
            );
          }
        }
      },
    );
  }
}
