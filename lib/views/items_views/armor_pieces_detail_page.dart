import 'package:elden_nexus/models/armor.dart';
import 'package:elden_nexus/views/items_views/armor_pieces_page.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../firebase/database/database.dart';

/// Detail page that displays a single Armor piece.
///
/// Shows image, stats table and "how to get" dialog.
/// @param armor Armor instance to display (passed in constructor).
class ArmorPiecesDetailPage extends StatefulWidget {
  final Armor armor;

  const ArmorPiecesDetailPage({super.key, required this.armor});

  @override
  State<ArmorPiecesDetailPage> createState() => _ArmorPiecesDetailPageState();
}

/// State for ArmorPiecesDetailPage.
class _ArmorPiecesDetailPageState extends State<ArmorPiecesDetailPage> {
  /// Launches an external URL using url_launcher.
  /// @param url The URL string to open.
  /// @return Future<void>
  void _launchURL(String url) async {
    // Attempt to launch the URL.
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  /// Convert a numeric stat to a display string.
  /// Returns "-" when stat equals 0.
  /// @param input numeric value
  /// @return String display value
  String resString(double input) {
    if (input == 0) {
      return "-";
    }
    return input.toString();
  }

  @override
  Widget build(BuildContext context) {
    double defaultHeight = 45;
    double defaultTableHeight = MediaQuery.of(context).size.height * 0.048;
    Armor armor = widget.armor;
    String url = armor.mapLink;
    bool isLinkable = url.isNotEmpty;

    // Build dialog action widgets: open link (if available) + close.
    List<Widget> linkWidgets = [];
    if (isLinkable) {
      linkWidgets.add(
        ElevatedButton(
          onPressed: () {
            _launchURL(url);
          },
          child: Text('Open Link'.tr),
        ),
      );
    }
    linkWidgets.add(
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    );

    return PopScope(
      canPop: false,
      onPopInvoked: (result) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ArmorPiecesPage(
              set: armor.image.contains("dlc")
                  ? DatabaseMethods.instance.allDBSOTEArmorSets.firstWhere(
                      (element) => element.name == armor.set,
                    )
                  : DatabaseMethods.instance.allDBArmorSets.firstWhere(
                      (element) => element.name == armor.set,
                    ),
              armorPieces: armor.image.contains("dlc")
                  ? DatabaseMethods.instance.allDBSOTEArmors
                        .where((element) => element.set == armor.set)
                        .toList()
                  : DatabaseMethods.instance.allDBArmors
                        .where((element) => element.set == armor.set)
                        .toList(),
            ),
          ),
        );
      },
      child: Scaffold(
        endDrawer: const Drawer(child: SettingsView()),
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(
                  Icons.arrow_circle_left_outlined,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                onPressed: () {
                  bool isDlc = armor.image.contains("dlc");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ArmorPiecesPage(
                          set: isDlc
                              ? DatabaseMethods.instance.allDBSOTEArmorSets
                                    .firstWhere(
                                      (element) => element.name == armor.set,
                                    )
                              : DatabaseMethods.instance.allDBArmorSets
                                    .firstWhere(
                                      (element) => element.name == armor.set,
                                    ),
                          armorPieces: isDlc
                              ? DatabaseMethods.instance.allDBSOTEArmors
                                    .where(
                                      (element) => element.set == armor.set,
                                    )
                                    .toList()
                              : DatabaseMethods.instance.allDBArmors
                                    .where(
                                      (element) => element.set == armor.set,
                                    )
                                    .toList(),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
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
                      child: Image.asset(armor.image),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Center(
                        child: Text(
                          'Weight: ${armor.weight}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Center(
                        child: Text(
                          armor.armorPiece
                                  .toString()
                                  .split('.')
                                  .last[0]
                                  .toUpperCase() +
                              armor.armorPiece
                                  .toString()
                                  .split('.')
                                  .last
                                  .substring(1),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
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
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(0.5),
                        },
                        children: [
                          TableRow(
                            children: [
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.background,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: defaultHeight,
                                      child: Center(
                                        child: Text(
                                          "Physical",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSecondary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondaryContainer,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.background,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: defaultHeight,
                                      child: Center(
                                        child: Text(
                                          resString(
                                            widget
                                                .armor
                                                .damageNegation
                                                .physical,
                                          ),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSecondaryContainer,
                                          ),
                                        ),
                                      ),
                                    ),
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
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.background,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: defaultHeight,
                                      child: Center(
                                        child: Text(
                                          "Strike",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSecondary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondaryContainer,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.background,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: defaultHeight,
                                      child: Center(
                                        child: Text(
                                          resString(
                                            widget.armor.damageNegation.strike,
                                          ),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSecondaryContainer,
                                          ),
                                        ),
                                      ),
                                    ),
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
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.background,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: defaultHeight,
                                      child: Center(
                                        child: Text(
                                          "Slash",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSecondary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondaryContainer,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.background,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: defaultHeight,
                                      child: Center(
                                        child: Text(
                                          resString(
                                            widget.armor.damageNegation.slash,
                                          ),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSecondaryContainer,
                                          ),
                                        ),
                                      ),
                                    ),
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
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.background,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: defaultHeight,
                                      child: Center(
                                        child: Text(
                                          "Pierce",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSecondary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondaryContainer,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.background,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: defaultHeight,
                                      child: Center(
                                        child: Text(
                                          resString(
                                            widget.armor.damageNegation.pierce,
                                          ),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSecondaryContainer,
                                          ),
                                        ),
                                      ),
                                    ),
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
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.background,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: defaultHeight,
                                      child: const Center(
                                        child: Text(
                                          "Magic",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(
                                              25,
                                              25,
                                              112,
                                              1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondaryContainer,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.background,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: defaultHeight,
                                      child: Center(
                                        child: Text(
                                          resString(
                                            widget.armor.damageNegation.magic,
                                          ),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                widget
                                                        .armor
                                                        .damageNegation
                                                        .magic !=
                                                    0
                                                ? const Color.fromRGBO(
                                                    125,
                                                    125,
                                                    212,
                                                    1,
                                                  )
                                                : Theme.of(context)
                                                      .colorScheme
                                                      .onSecondaryContainer,
                                          ),
                                        ),
                                      ),
                                    ),
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
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.background,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: defaultHeight,
                                      child: const Center(
                                        child: Text(
                                          "Fire",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(139, 0, 0, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondaryContainer,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.background,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: defaultHeight,
                                      child: Center(
                                        child: Text(
                                          resString(
                                            widget.armor.damageNegation.fire,
                                          ),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                widget
                                                        .armor
                                                        .damageNegation
                                                        .fire !=
                                                    0
                                                ? const Color.fromRGBO(
                                                    239,
                                                    0,
                                                    0,
                                                    1,
                                                  )
                                                : Theme.of(context)
                                                      .colorScheme
                                                      .onSecondaryContainer,
                                          ),
                                        ),
                                      ),
                                    ),
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
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.background,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: defaultHeight,
                                      child: const Center(
                                        child: Text(
                                          "Holy",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(
                                              184,
                                              134,
                                              11,
                                              1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondaryContainer,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.background,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: defaultHeight,
                                      child: Center(
                                        child: Text(
                                          resString(
                                            widget.armor.damageNegation.holy,
                                          ),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                widget
                                                        .armor
                                                        .damageNegation
                                                        .holy !=
                                                    0
                                                ? const Color.fromRGBO(
                                                    234,
                                                    184,
                                                    61,
                                                    1,
                                                  )
                                                : Theme.of(context)
                                                      .colorScheme
                                                      .onSecondaryContainer,
                                          ),
                                        ),
                                      ),
                                    ),
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
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.background,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: defaultHeight,
                                      child: const Center(
                                        child: Text(
                                          "Lightning",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(
                                              173,
                                              173,
                                              0,
                                              1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: defaultTableHeight,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondaryContainer,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.background,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: defaultHeight,
                                      child: Center(
                                        child: Text(
                                          resString(
                                            widget
                                                .armor
                                                .damageNegation
                                                .lightning,
                                          ),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                widget
                                                        .armor
                                                        .damageNegation
                                                        .lightning !=
                                                    0
                                                ? const Color.fromRGBO(
                                                    223,
                                                    223,
                                                    0,
                                                    1,
                                                  )
                                                : Theme.of(context)
                                                      .colorScheme
                                                      .onSecondaryContainer,
                                          ),
                                        ),
                                      ),
                                    ),
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
                            child: Text(armor.howToFind),
                          ),
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: linkWidgets,
                          ),
                        ],
                      ),
                    );
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
