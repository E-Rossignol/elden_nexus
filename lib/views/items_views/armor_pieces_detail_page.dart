import 'package:elden_nexus/models/armor.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../firebase/database/database.dart';
import '../../models/armor_set.dart';
import 'armors_set_detail_page.dart';

class ArmorPiecesDetailPage extends StatefulWidget {
  final Armor armor;
  const ArmorPiecesDetailPage({super.key, required this.armor});

  @override
  State<ArmorPiecesDetailPage> createState() => _ArmorPiecesDetailPageState();
}

class _ArmorPiecesDetailPageState extends State<ArmorPiecesDetailPage> {

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  String resString(double input) {
    if (input == 0) {
      return "-";
    }
    return input.toString();
  }

  @override
  Widget build(BuildContext context) {
    double defaultHeight = 45;
    Armor armor = widget.armor;
    String url = armor.mapLink;
    bool isLinkable = url.isNotEmpty;
    List<Widget> linkWidgets = [];
    if (isLinkable) {
      linkWidgets.add(ElevatedButton(
        onPressed: () {
          _launchURL(url);
        },
        child: const Text('Open Link'),
      ));
    }
    linkWidgets.add(TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text('Close'),
    ));
    return PopScope(
      canPop: false,
      child: Scaffold(
        endDrawer: const Drawer(
          child: SettingsView(),
        ),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.arrow_circle_left_outlined, color: Theme.of(context).colorScheme.onSurface),
              onPressed: () {
                bool isDlc = armor.image.contains("dlc");
                List<ArmorSet> allSets = isDlc ? DatabaseMethods.instance.allDBSOTEArmorSets: DatabaseMethods.instance.allDBArmorSets;
                ArmorSet set = allSets.where((element) => element.name == armor.set).first;
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return ArmorSetDetailPage(armorSet: set);
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
              armor.name.toUpperCase(),
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
                      child: Image.asset(armor.image),
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "Weight: ${armor.weight}",
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Chiralla'),
                            ),
                            if (armor.passive.isNotEmpty)
                              Text(
                                "Passive: ${armor.passive}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Chiralla'),
                              ),
                          ],
                        ),
                      )),
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
                          title: Text('How to get ${armor.name}:'),
                          content: SingleChildScrollView(
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(armor.howToFind)),
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: linkWidgets,
                            ),
                          ],
                        ));
                  },
                  child: const Text('How to get it'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
