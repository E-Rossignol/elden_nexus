import 'package:elden_nexus/models/armor.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/constant.dart';
import '../../models/armor_set.dart';
import 'armors_page.dart';

class ArmorDetailPage extends StatefulWidget {
  final ArmorSet armor;
  final List<Armor> armorPieces;
  const ArmorDetailPage({super.key, required this.armor, required this.armorPieces});

  @override
  State<ArmorDetailPage> createState() => _ArmorDetailPageState();
}

class _ArmorDetailPageState extends State<ArmorDetailPage> {

  String resString(double input) {
    if (input == 0) {
      return "-";
    }
    return input.toString();
  }

  Widget _armorPieces(){
    Armor helm = widget.armorPieces.firstWhere((element) => element.armorPiece == ArmorPiece.helm) ?? Armor(name: "No helm", image: "", armorPiece: ArmorPiece.helm, howToFind: "", mapLink: "", weight: 0, damageNegation: DamageNegation(physical: 0, strike: 0, slash: 0, pierce: 0, magic: 0, fire: 0, lightning: 0, holy: 0), set: "", passive: "");
    Armor chest = widget.armorPieces.firstWhere((element) => element.armorPiece == ArmorPiece.chest) ?? Armor(name: "No chest", image: "", armorPiece: ArmorPiece.chest, howToFind: "", mapLink: "", weight: 0, damageNegation: DamageNegation(physical: 0, strike: 0, slash: 0, pierce: 0, magic: 0, fire: 0, lightning: 0, holy: 0), set: "", passive: "");
    Armor gauntlet = widget.armorPieces.firstWhere((element) => element.armorPiece == ArmorPiece.gauntlets) ?? Armor(name: "No gauntlet", image: "", armorPiece: ArmorPiece.gauntlets, howToFind: "", mapLink: "", weight: 0, damageNegation: DamageNegation(physical: 0, strike: 0, slash: 0, pierce: 0, magic: 0, fire: 0, lightning: 0, holy: 0), set: "", passive: "");
    Armor leg = widget.armorPieces.firstWhere((element) => element.armorPiece == ArmorPiece.leg) ?? Armor(name: "No leg", image: "", armorPiece: ArmorPiece.leg, howToFind: "", mapLink: "", weight: 0, damageNegation: DamageNegation(physical: 0, strike: 0, slash: 0, pierce: 0, magic: 0, fire: 0, lightning: 0, holy: 0), set: "", passive: "");
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Table(
        children: [
          TableRow(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Transform.scale(
                      scale: 0.8,
                      child: Image.asset(helm.image),
                    ),
                  ),
                  Text(helm.name),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Transform.scale(
                      scale: 0.8,
                      child: Image.asset(chest.image),
                    ),
                  ),
                  Text(chest.name),
                ],
              ),
            ]
          ),
          TableRow(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Transform.scale(
                      scale: 0.8,
                      child: Image.asset(gauntlet.image),
                    ),
                  ),
                  Text(gauntlet.name),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Transform.scale(
                      scale: 0.8,
                      child: Image.asset(leg.image),
                    ),
                  ),
                  Text(leg.name),
                ],
              ),
            ]
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    double defaultHeight = 45;
    ArmorSet armorSet = widget.armor;
    return PopScope(
      canPop: true,
      child: Scaffold(
        endDrawer: const Drawer(
          child: SettingsView(),
        ),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ArmorsPage(isDlc: widget.armor.image.contains("dlc"));
                }));
              },
            );
          }),
          automaticallyImplyLeading: false,
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
          ],
          title: Center(
            child: Text(
              armorSet.name.toUpperCase(),
              style: const TextStyle(fontFamily: 'Mantinia', fontSize: 16),
              maxLines: 1,
            ),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Transform.scale(
                      scale: 0.8,
                      child: Image.asset(armorSet.image),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(1), // First column is half the size
                        1: FlexColumnWidth(0.5),
                      },
                      children: [
                        TableRow(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.secondary,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                              child: Center(
                                  child: Container(
                                      height: defaultHeight,
                                      child: Center(
                                          child: Text("Physical",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondary))))),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                              child: Center(
                                child: Container(
                                    height: defaultHeight,
                                    child: Center(
                                        child: Text(
                                            resString(widget
                                                .armor.damageNegation.physical),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondaryContainer)))),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.secondary,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                              child: Center(
                                  child: Container(
                                      height: defaultHeight,
                                      child: Center(
                                          child: Text("Strike",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondary))))),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                              child: Center(
                                child: Container(
                                    height: defaultHeight,
                                    child: Center(
                                        child: Text(
                                            resString(widget
                                                .armor.damageNegation.strike),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondaryContainer)))),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.secondary,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                              child: Center(
                                  child: Container(
                                      height: defaultHeight,
                                      child: Center(
                                          child: Text("Slash",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondary))))),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                              child: Center(
                                child: Container(
                                    height: defaultHeight,
                                    child: Center(
                                        child: Text(
                                            resString(widget
                                                .armor.damageNegation.slash),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondaryContainer)))),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.secondary,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                              child: Center(
                                  child: Container(
                                      height: defaultHeight,
                                      child: Center(
                                          child: Text("Pierce",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondary))))),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                              child: Center(
                                child: Container(
                                    height: defaultHeight,
                                    child: Center(
                                        child: Text(
                                            resString(widget
                                                .armor.damageNegation.pierce),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondaryContainer)))),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.secondary,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                              child: Center(
                                  child: Container(
                                      height: defaultHeight,
                                      child: const Center(
                                          child: Text("Magic",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      25, 25, 112, 1)))))),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                              child: Center(
                                child: Container(
                                    height: defaultHeight,
                                    child: Center(
                                        child: Text(
                                            resString(widget
                                                .armor.damageNegation.magic),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: widget.armor.damageNegation
                                                            .magic !=
                                                        0
                                                    ? const Color.fromRGBO(
                                                        125, 125, 212, 1)
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .onSecondaryContainer)))),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.secondary,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                              child: Center(
                                  child: Container(
                                      height: defaultHeight,
                                      child: const Center(
                                          child: Text("Fire",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      139, 0, 0, 1)))))),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                              child: Center(
                                child: Container(
                                    height: defaultHeight,
                                    child: Center(
                                        child: Text(
                                            resString(
                                                widget.armor.damageNegation.fire),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: widget.armor.damageNegation
                                                            .fire !=
                                                        0
                                                    ? const Color.fromRGBO(239, 0, 0, 1)
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .onSecondaryContainer)))),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.secondary,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                              child: Center(
                                  child: Container(
                                      height: defaultHeight,
                                      child: const Center(
                                          child: Text("Holy",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      184, 134, 11, 1)))))),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                              child: Center(
                                child: Container(
                                    height: defaultHeight,
                                    child: Center(
                                        child: Text(
                                            resString(
                                                widget.armor.damageNegation.holy),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: widget.armor.damageNegation
                                                            .holy !=
                                                        0
                                                    ? const Color.fromRGBO(
                                                        234, 184, 61, 1)
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .onSecondaryContainer)))),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.secondary,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                              child: Center(
                                  child: Container(
                                      height: defaultHeight,
                                      child: const Center(
                                          child: Text("Lightning",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      173, 173, 0, 1)))))),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                              child: Center(
                                child: Container(
                                    height: defaultHeight,
                                    child: Center(
                                        child: Text(
                                            resString(widget
                                                .armor.damageNegation.lightning),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: widget.armor.damageNegation
                                                            .lightning !=
                                                        0
                                                    ? const Color.fromRGBO(
                                                        223, 223, 0, 1)
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .onSecondaryContainer)))),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text(armorSet.name),
                          content: _armorPieces(),
                            ));
                  },
                  child: const Text('Armor pieces'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
