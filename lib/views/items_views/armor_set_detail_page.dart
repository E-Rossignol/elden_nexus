import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/models/armor.dart';
import 'package:elden_nexus/views/items_views/armor_pieces_page.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/armor_set.dart';
import 'armor_sets_page.dart';

class ArmorSetDetailPage extends StatefulWidget {
  final ArmorSet armorSet;

  const ArmorSetDetailPage({super.key, required this.armorSet});

  @override
  State<ArmorSetDetailPage> createState() => _ArmorSetDetailPageState();
}

class _ArmorSetDetailPageState extends State<ArmorSetDetailPage> {
  String resString(double input) {
    if (input == 0) {
      return "-";
    }
    return input.toString();
  }

  @override
  Widget build(BuildContext context) {
    double defaultHeight = 45;
    ArmorSet armorSet = widget.armorSet;
    double defaultTableHeight = MediaQuery.of(context).size.height * 0.048;
    return PopScope(
      canPop: false,
      onPopInvoked: (result) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ArmorSetsPage(
                isDlc: widget.armorSet.image.contains("dlc"),
              ),
            ));
      },
      child: Scaffold(
        endDrawer: const Drawer(
          child: SettingsView(),
        ),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.arrow_circle_left_outlined,
                  color: Theme.of(context).colorScheme.onSurface),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return ArmorSetsPage(
                      isDlc: widget.armorSet.image.contains("dlc"));
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
              style: const TextStyle(fontFamily: 'Mantinia', fontSize: 18),
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
                    height: MediaQuery.of(context).size.height * 0.24,
                    child: Transform.scale(
                      scale: 0.8,
                      child: Image.asset(armorSet.image),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                    child: ElevatedButton(
                      onPressed: () {
                        bool isDlc = widget.armorSet.image.contains("dlc");
                        List<Armor> allArmors = isDlc
                            ? DatabaseMethods.instance.allDBSOTEArmors
                            : DatabaseMethods.instance.allDBArmors;
                        List<Armor> armorPieces = allArmors
                            .where((element) =>
                                element.set == widget.armorSet.name)
                            .toList();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArmorPiecesPage(
                                armorPieces: armorPieces, set: widget.armorSet),
                          ),
                        );
                      },
                      child: Text('Armor pieces'.tr.toUpperCase(),
                          style: TextStyle(
                              fontFamily: 'Mantinia',
                              fontSize: 17,
                              color: Theme.of(context).colorScheme.primary)),
                    ),
                  ),
                  armorSet.passive != ""
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              armorSet.passive,
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontSize: 18),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Center(
                        child: Text(
                          'Weight: ${armorSet.weight}',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(
                              1), // First column is half the size
                          1: FlexColumnWidth(0.5),
                        },
                        children: [
                          TableRow(
                            children: [
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
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
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onSecondary))))),
                                ),
                              ),
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
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
                                                resString(widget.armorSet
                                                    .damageNegation.physical),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSecondaryContainer)))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
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
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onSecondary))))),
                                ),
                              ),
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
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
                                                resString(widget.armorSet
                                                    .damageNegation.strike),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSecondaryContainer)))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
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
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onSecondary))))),
                                ),
                              ),
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
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
                                                resString(widget.armorSet
                                                    .damageNegation.slash),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSecondaryContainer)))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
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
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onSecondary))))),
                                ),
                              ),
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
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
                                                resString(widget.armorSet
                                                    .damageNegation.pierce),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSecondaryContainer)))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
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
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromRGBO(
                                                          25, 25, 112, 1)))))),
                                ),
                              ),
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
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
                                                resString(widget.armorSet
                                                    .damageNegation.magic),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: widget
                                                                .armorSet
                                                                .damageNegation
                                                                .magic !=
                                                            0
                                                        ? const Color.fromRGBO(
                                                            125, 125, 212, 1)
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .onSecondaryContainer)))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
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
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromRGBO(
                                                          139, 0, 0, 1)))))),
                                ),
                              ),
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
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
                                                resString(widget.armorSet
                                                    .damageNegation.fire),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: widget
                                                                .armorSet
                                                                .damageNegation
                                                                .fire !=
                                                            0
                                                        ? const Color.fromRGBO(
                                                            239, 0, 0, 1)
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .onSecondaryContainer)))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
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
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromRGBO(
                                                          184, 134, 11, 1)))))),
                                ),
                              ),
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
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
                                                resString(widget.armorSet
                                                    .damageNegation.holy),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: widget
                                                                .armorSet
                                                                .damageNegation
                                                                .holy !=
                                                            0
                                                        ? const Color.fromRGBO(
                                                            234, 184, 61, 1)
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .onSecondaryContainer)))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
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
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromRGBO(
                                                          173, 173, 0, 1)))))),
                                ),
                              ),
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
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
                                                resString(widget.armorSet
                                                    .damageNegation.lightning),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: widget
                                                                .armorSet
                                                                .damageNegation
                                                                .lightning !=
                                                            0
                                                        ? const Color.fromRGBO(
                                                            223, 223, 0, 1)
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .onSecondaryContainer)))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
