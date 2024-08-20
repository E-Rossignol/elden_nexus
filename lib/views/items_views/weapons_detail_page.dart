import 'package:elden_nexus/constants/constant.dart';
import 'package:elden_nexus/models/weapon.dart';
import 'package:elden_nexus/views/items_views/weapons_page.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/helper.dart';

class WeaponDetailPage extends StatefulWidget {
  final Weapon weapon;
  const WeaponDetailPage({super.key, required this.weapon});

  @override
  State<WeaponDetailPage> createState() => _WeaponDetailPageState();
}

class _WeaponDetailPageState extends State<WeaponDetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Color> statusColors;

  void _launchURL(String url) async {
    if (url == 'Default Link') {
      return;
    }
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _statusEffect(bool exists) {
    String statusPath = "";
    String statusStr = "";
    double? statusValue = 0;
    if (exists) {
      StatusEffect status = widget.weapon.status.keys.first;
      statusValue = widget.weapon.status[widget.weapon.status.keys.first];
      switch (status) {
        case StatusEffect.blood_loss:
          statusColors = [Colors.red, Colors.purple, Colors.red];
          statusPath = "lib/constants/images/status_effects/blood_loss.png";
          statusStr = "Bleed";
          break;
        case StatusEffect.deadly_poison:
          statusColors = [Colors.black, Colors.green, Colors.white12];
          statusPath = "lib/constants/images/status_effects/poison.png";
          statusStr = "Deadly Poison";
          break;
        case StatusEffect.death_blight:
          statusColors = [
            Colors.black,
            Colors.grey,
            Theme.of(context).colorScheme.onBackground
          ];
          statusPath = "lib/constants/images/status_effects/death_blight.png";
          statusStr = "Death Blight";
          break;
        case StatusEffect.eternal_sleep:
          statusColors = [Colors.lightBlueAccent, Colors.purple, Colors.blue];
          statusPath = "lib/constants/images/status_effects/sleep.png";
          statusStr = "Eternal Sleep";
          break;
        case StatusEffect.frostbite:
          statusColors = [
            Colors.blue,
            Theme.of(context).colorScheme.onBackground,
            Colors.blueAccent
          ];
          statusPath = "lib/constants/images/status_effects/frostbite.png";
          statusStr = "Frostbite";
          break;
        case StatusEffect.madness:
          statusColors = [Colors.red, Colors.yellow, Colors.deepOrange];
          statusPath = "lib/constants/images/status_effects/madness.png";
          statusStr = "Madness";
          break;
        case StatusEffect.poison:
          statusColors = [Colors.greenAccent, Colors.green, Colors.white12];
          statusPath = "lib/constants/images/status_effects/poison.png";
          statusStr = "Poison";
          break;
        case StatusEffect.scarlet_rot:
          statusColors = [Colors.red, Colors.pink, Colors.redAccent];
          statusPath = "lib/constants/images/status_effects/scarlet_rot.png";
          statusStr = "Scarlet Rot";
          break;
        case StatusEffect.sleep:
          statusColors = [Colors.lightBlueAccent, Colors.purple, Colors.blue];
          statusPath = "lib/constants/images/status_effects/sleep.png";
          statusStr = "Sleep";
          break;
      }
    }
    List<Widget> hasStatus = [
      Image.asset(statusPath, height: 40, width: 40),
      AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: statusColors,
                stops: [
                  _controller.value - 1,
                  _controller.value,
                  _controller.value + 1,
                ],
              ).createShader(bounds);
            },
            child: Text(
              " $statusStr : ${statusValue.toString()} ",
              style: const TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Chiralla'),
            ),
          );
        },
      )
    ];
    List<Widget> hasNoStatus = [
      const Center(
        child: Text(""),
      )
    ];
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: exists ? hasStatus : hasNoStatus,
          ),
        ));
  }

  String requirement(double input) {
    if (input == 0) {
      return "-";
    }
    return input.toInt().toString();
  }

  Widget damageWidget() {
    String incStr = "";
    double percentage = 0.0;
    if (widget.weapon.weaponCategory == WeaponCategory.glintstone_staff) {
      incStr = "Sorcery";
      percentage = 0.45;
    } else if (widget.weapon.weaponCategory == WeaponCategory.sacred_seal) {
      incStr = "Incantation";
      percentage = 0.45;
    } else {
      percentage = 0.4;
      incStr = "NONE";
    }
    double defaultHeight = 60;
    return SizedBox(
      height: MediaQuery.of(context).size.height * percentage,
      width: MediaQuery.of(context).size.width * 0.65,
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
                        color: Theme.of(context).colorScheme.background)),
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
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.background)),
                child: Center(
                  child: Container(
                      height: defaultHeight,
                      child: Center(
                          child: Text(
                              damagesString(widget.weapon.damages.physical),
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
                        color: Theme.of(context).colorScheme.background)),
                child: Center(
                    child: Container(
                        height: defaultHeight,
                        child: const Center(
                            child: Text("Magic",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(25, 25, 112, 1)))))),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.background)),
                child: Center(
                  child: Container(
                      height: defaultHeight,
                      child: Center(
                          child: Text(
                              damagesString(widget.weapon.damages.magic),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: widget.weapon.damages.magic != 0
                                      ? const Color.fromRGBO(125, 125, 212, 1)
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
                        color: Theme.of(context).colorScheme.background)),
                child: Center(
                    child: Container(
                        height: defaultHeight,
                        child: const Center(
                            child: Text("Fire",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(139, 0, 0, 1)))))),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.background)),
                child: Center(
                  child: Container(
                      height: defaultHeight,
                      child: Center(
                          child: Text(damagesString(widget.weapon.damages.fire),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: widget.weapon.damages.fire != 0
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
                        color: Theme.of(context).colorScheme.background)),
                child: Center(
                    child: Container(
                        height: defaultHeight,
                        child: const Center(
                            child: Text("Holy",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(184, 134, 11, 1)))))),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.background)),
                child: Center(
                  child: Container(
                      height: defaultHeight,
                      child: Center(
                          child: Text(damagesString(widget.weapon.damages.holy),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: widget.weapon.damages.holy != 0
                                      ? const Color.fromRGBO(234, 184, 61, 1)
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
                        color: Theme.of(context).colorScheme.background)),
                child: Center(
                    child: Container(
                        height: defaultHeight,
                        child: const Center(
                            child: Text("Lightning",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(173, 173, 0, 1)))))),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.background)),
                child: Center(
                  child: Container(
                      height: defaultHeight,
                      child: Center(
                          child: Text(
                              damagesString(widget.weapon.damages.lightning),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: widget.weapon.damages.lightning != 0
                                      ? const Color.fromRGBO(223, 223, 0, 1)
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
                        color: Theme.of(context).colorScheme.background)),
                child: Center(
                    child: Container(
                        height: defaultHeight,
                        child: Center(
                            child: Text("Critical",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary))))),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.background)),
                child: Center(
                  child: Container(
                      height: defaultHeight,
                      child: Center(
                          child: Text(
                              damagesString(widget.weapon.damages.critical),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer)))),
                ),
              ),
            ],
          ),
          if (incStr != "NONE")
            TableRow(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.background)),
                  child: Center(
                      child: Container(
                          height: defaultHeight,
                          child: Center(
                              child: Text(incStr,
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary))))),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.background)),
                  child: Center(
                    child: Container(
                        height: defaultHeight,
                        child: Center(
                            child: Text(
                                damagesString(widget.weapon.damages.sorc),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer)))),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double defaultHeight = 60;
    Weapon weapon = widget.weapon;
    statusColors = [Colors.orangeAccent, Colors.yellow, Colors.red];
    String isSomberStr =
        weapon.isSomber ? 'Somber Smithing Stones' : 'Smithing Stones';
    String weight = "Weight: ${weapon.weight}";
    String url = weapon.mapLink;
    bool isLinkable = url.isNotEmpty;
    bool hasStatus = weapon.status.isNotEmpty;
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return WeaponsPage(isDlc: widget.weapon.image.contains("dlc"));
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
              weapon.name.toUpperCase(),
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
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Transform.scale(
                    scale: 0.8,
                    child: Image.asset(weapon.image),
                  ),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            Helper.strCat(weapon.weaponCategory).toUpperCase(),
                            style: const TextStyle(
                                fontFamily: 'Chiralla', fontSize: 18),
                            maxLines: 1,
                          ),
                          Text(
                            isSomberStr,
                            style: const TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Chiralla'),
                          ),
                          Text(
                            weight,
                            style: const TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Chiralla'),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: _statusEffect(hasStatus)),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45 - 60,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(0.5),
                        // First column is half the size
                        1: FlexColumnWidth(1),
                        2: FlexColumnWidth(1),
                      },
                      children: [
                        TableRow(
                          children: [
                            Center(
                                child: Container(
                                    height: defaultHeight / 2,
                                    child: const Text(""))),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.secondary,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                              child: Center(
                                  child: Container(
                                      height: defaultHeight / 2,
                                      child: Center(
                                          child: Text("Scaling",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondary))))),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.secondary,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                              child: Center(
                                  child: Container(
                                      height: defaultHeight / 2,
                                      child: Center(
                                          child: Text("Requirements",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondary))))),
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
                                          child: Text("STR",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
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
                                          child: Text(weapon.scaling.str,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondaryContainer,
                                                  fontWeight:
                                                      FontWeight.bold))))),
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
                                            requirement(weapon.requirements.str),
                                            style: TextStyle(
                                                color:
                                                    weapon.requirements.str != 0
                                                        ? Colors.redAccent
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .onSecondaryContainer,
                                                fontWeight: FontWeight.bold)))),
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
                                          child: Text("DEX",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
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
                                          child: Text(weapon.scaling.dex,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondaryContainer,
                                                  fontWeight:
                                                      FontWeight.bold))))),
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
                                              requirement(
                                                  weapon.requirements.dex),
                                              style: TextStyle(
                                                  color: weapon
                                                              .requirements.dex !=
                                                          0
                                                      ? Colors.redAccent
                                                      : Theme.of(context)
                                                          .colorScheme
                                                          .onSecondaryContainer,
                                                  fontWeight:
                                                      FontWeight.bold))))),
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
                                          child: Text("INT",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
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
                                          child: Text(weapon.scaling.int,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondaryContainer,
                                                  fontWeight:
                                                      FontWeight.bold))))),
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
                                              requirement(
                                                  weapon.requirements.int),
                                              style: TextStyle(
                                                  color: weapon
                                                              .requirements.int !=
                                                          0
                                                      ? Colors.redAccent
                                                      : Theme.of(context)
                                                          .colorScheme
                                                          .onSecondaryContainer,
                                                  fontWeight:
                                                      FontWeight.bold))))),
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
                                          child: Text("FAITH",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
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
                                          child: Text(weapon.scaling.fai,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondaryContainer,
                                                  fontWeight:
                                                      FontWeight.bold))))),
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
                                              requirement(
                                                  weapon.requirements.fai),
                                              style: TextStyle(
                                                  color: weapon
                                                              .requirements.fai !=
                                                          0
                                                      ? Colors.redAccent
                                                      : Theme.of(context)
                                                          .colorScheme
                                                          .onSecondaryContainer,
                                                  fontWeight:
                                                      FontWeight.bold))))),
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
                                          child: Text("ARC",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
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
                                          child: Text(weapon.scaling.arc,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondaryContainer,
                                                  fontWeight:
                                                      FontWeight.bold))))),
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
                                              requirement(
                                                  weapon.requirements.arc),
                                              style: TextStyle(
                                                  color: weapon
                                                              .requirements.arc !=
                                                          0
                                                      ? Colors.redAccent
                                                      : Theme.of(context)
                                                          .colorScheme
                                                          .onSecondaryContainer,
                                                  fontWeight:
                                                      FontWeight.bold))))),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 60, 20),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('How to get ${weapon.name}:'),
                            content: SingleChildScrollView(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(weapon.howToFind)),
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
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(60, 0, 0, 20),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Center(child: Text('Damages')),
                            content: SingleChildScrollView(
                              child: damageWidget(),
                            ),
                            actions: [
                              Center(
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close')),
                              )
                            ],
                          ));
                },
                child: const Text('Damages'),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  String damagesString(double input) {
    if (input == 0) {
      return "-";
    }
    return input.toInt().toString();
  }
}
