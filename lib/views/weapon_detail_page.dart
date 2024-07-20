import 'package:elden_nexus/constants/constant.dart';
import 'package:elden_nexus/models/weapon.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/helper.dart';
import 'package:photo_view/photo_view.dart';

class WeaponDetailPage extends StatefulWidget {
  final Weapon weapon;

  const WeaponDetailPage({super.key, required this.weapon});

  @override
  State<WeaponDetailPage> createState() => _WeaponDetailPageState();
}

class _WeaponDetailPageState extends State<WeaponDetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Widget _space() {
    return const SizedBox(
      height: 10,
    );
  }

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
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _statusEffect() {
    StatusEffect status = widget.weapon.status.keys.first;
    double? statusValue = widget.weapon.status[widget.weapon.status.keys.first];
    String statusPath = "";
    String statusStr = "";
    switch (status) {
      case StatusEffect.blood_loss:
        statusPath = "lib/constants/images/status_effects/blood_loss.png";
        statusStr = "Blood Loss";
        break;
      case StatusEffect.deadly_poison:
        statusPath = "lib/constants/images/status_effects/poison.png";
        statusStr = "Deadly Poison";
        break;
      case StatusEffect.death_blight:
        statusPath = "lib/constants/images/status_effects/death_blight.png";
        statusStr = "Death Blight";
        break;
      case StatusEffect.eternal_sleep:
        statusPath = "lib/constants/images/status_effects/sleep.png";
        statusStr = "Eternal Sleep";
        break;
      case StatusEffect.frostbite:
        statusPath = "lib/constants/images/status_effects/frostbite.png";
        statusStr = "Frostbite";
        break;
      case StatusEffect.madness:
        statusPath = "lib/constants/images/status_effects/madness.png";
        statusStr = "Madness";
        break;
      case StatusEffect.poison:
        statusPath = "lib/constants/images/status_effects/poison.png";
        statusStr = "Poison";
        break;
      case StatusEffect.scarlet_rot:
        statusPath = "lib/constants/images/status_effects/scarlet_rot.png";
        statusStr = "Scarlet Rot";
        break;
      case StatusEffect.sleep:
        statusPath = "lib/constants/images/status_effects/sleep.png";
        statusStr = "Sleep";
        break;
    }
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(statusPath, height: 40, width: 40),
              Text(
                "${statusValue.toString()} $statusStr",
                style: const TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Chiralla'),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Weapon weapon = widget.weapon;
    String isSomberStr =
        weapon.isSomber ? 'Somber Smithing Stones' : 'Smithing Stones';
    List<String> gridStr = [
      'STR',
      'DEX',
      'INT',
      'FAI',
      'ARC',
      'Weight',
      'Ash of War:'
    ];
    List<String> scalingStr = [
      weapon.scaling.str,
      weapon.scaling.dex,
      weapon.scaling.int,
      weapon.scaling.fai,
      weapon.scaling.arc,
    ];
    String aow = weapon.ashOfWar;
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
    return Scaffold(
      endDrawer: const Drawer(
        child: SettingsView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
      appBar: AppBar(
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            _space(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Transform.scale(
                scale: 0.8,
                child: Image.asset(weapon.image),
              ),
            ),
            if (hasStatus)
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: _statusEffect()),
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
                    ],
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                              top: BorderSide(
                                color: Theme.of(context).colorScheme.onPrimary,
                                width: 2.0,
                              ),
                            )),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: Text(
                                  gridStr[0],
                                  style: const TextStyle(
                                      fontFamily: "Chiralla", fontSize: 20),
                                )),
                                Expanded(
                                    child: scalingStr[0] == "-"
                                        ? Text(scalingStr[0],
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface,
                                                fontFamily: 'Chiralla',
                                                fontSize: 18))
                                        : AnimatedBuilder(
                                            animation: _controller,
                                            builder: (BuildContext context,
                                                Widget? child) {
                                              return ShaderMask(
                                                shaderCallback: (Rect bounds) {
                                                  return LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: const <Color>[
                                                      Colors.orangeAccent,
                                                      Colors.yellow,
                                                      Colors.red
                                                    ],
                                                    stops: [
                                                      _controller.value - 1,
                                                      _controller.value,
                                                      _controller.value + 1,
                                                    ],
                                                  ).createShader(bounds);
                                                },
                                                child: Text(
                                                  scalingStr[0],
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onPrimaryContainer,
                                                      fontSize: 18,
                                                      fontFamily: 'Chiralla'),
                                                ),
                                              );
                                            },
                                          )),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                              top: BorderSide(
                                color: Theme.of(context).colorScheme.onPrimary,
                                width: 2.0,
                              ),
                            )),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: Text(
                                  gridStr[1],
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontFamily: "Chiralla",
                                      fontSize: 20),
                                )),
                                Expanded(
                                    child: scalingStr[1] == "-"
                                        ? Text(scalingStr[1],
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface,
                                                fontFamily: 'Chiralla',
                                                fontSize: 18))
                                        : AnimatedBuilder(
                                            animation: _controller,
                                            builder: (BuildContext context,
                                                Widget? child) {
                                              return ShaderMask(
                                                shaderCallback: (Rect bounds) {
                                                  return LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: const <Color>[
                                                      Colors.orangeAccent,
                                                      Colors.yellow,
                                                      Colors.red
                                                    ],
                                                    stops: [
                                                      _controller.value - 1,
                                                      _controller.value,
                                                      _controller.value + 1,
                                                    ],
                                                  ).createShader(bounds);
                                                },
                                                child: Text(
                                                  scalingStr[1],
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onPrimaryContainer,
                                                      fontSize: 18,
                                                      fontFamily: 'Chiralla'),
                                                ),
                                              );
                                            },
                                          )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                              top: BorderSide(
                                color: Theme.of(context).colorScheme.onPrimary,
                                width: 2.0,
                              ),
                            )),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: Text(
                                  gridStr[2],
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontFamily: "Chiralla",
                                      fontSize: 20),
                                )),
                                Expanded(
                                    child: scalingStr[2] == "-"
                                        ? Text(scalingStr[2],
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface,
                                                fontFamily: 'Chiralla',
                                                fontSize: 18))
                                        : AnimatedBuilder(
                                            animation: _controller,
                                            builder: (BuildContext context,
                                                Widget? child) {
                                              return ShaderMask(
                                                shaderCallback: (Rect bounds) {
                                                  return LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: const <Color>[
                                                      Colors.orangeAccent,
                                                      Colors.yellow,
                                                      Colors.red
                                                    ],
                                                    stops: [
                                                      _controller.value - 1,
                                                      _controller.value,
                                                      _controller.value + 1,
                                                    ],
                                                  ).createShader(bounds);
                                                },
                                                child: Text(
                                                  scalingStr[2],
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onPrimaryContainer,
                                                      fontSize: 18,
                                                      fontFamily: 'Chiralla'),
                                                ),
                                              );
                                            },
                                          )),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                              top: BorderSide(
                                color: Theme.of(context).colorScheme.onPrimary,
                                width: 2.0,
                              ),
                            )),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: Text(
                                  gridStr[3],
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontFamily: "Chiralla",
                                      fontSize: 20),
                                )),
                                Expanded(
                                    child: scalingStr[3] == "-"
                                        ? Text(scalingStr[3],
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface,
                                                fontFamily: 'Chiralla',
                                                fontSize: 18))
                                        : AnimatedBuilder(
                                            animation: _controller,
                                            builder: (BuildContext context,
                                                Widget? child) {
                                              return ShaderMask(
                                                shaderCallback: (Rect bounds) {
                                                  return LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: const <Color>[
                                                      Colors.orangeAccent,
                                                      Colors.yellow,
                                                      Colors.red
                                                    ],
                                                    stops: [
                                                      _controller.value - 1,
                                                      _controller.value,
                                                      _controller.value + 1,
                                                    ],
                                                  ).createShader(bounds);
                                                },
                                                child: Text(
                                                  scalingStr[3],
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onPrimaryContainer,
                                                      fontSize: 18,
                                                      fontFamily: 'Chiralla'),
                                                ),
                                              );
                                            },
                                          )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                              top: BorderSide(
                                color: Theme.of(context).colorScheme.onPrimary,
                                width: 2.0,
                              ),
                            )),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: Text(
                                  gridStr[4],
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontFamily: "Chiralla",
                                      fontSize: 20),
                                )),
                                Expanded(
                                    child: scalingStr[4] == "-"
                                        ? Text(scalingStr[4],
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface,
                                                fontFamily: 'Chiralla',
                                                fontSize: 18))
                                        : AnimatedBuilder(
                                            animation: _controller,
                                            builder: (BuildContext context,
                                                Widget? child) {
                                              return ShaderMask(
                                                shaderCallback: (Rect bounds) {
                                                  return LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: const <Color>[
                                                      Colors.orangeAccent,
                                                      Colors.yellow,
                                                      Colors.red
                                                    ],
                                                    stops: [
                                                      _controller.value - 1,
                                                      _controller.value,
                                                      _controller.value + 1,
                                                    ],
                                                  ).createShader(bounds);
                                                },
                                                child: Text(
                                                  scalingStr[4],
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onPrimaryContainer,
                                                      fontSize: 18,
                                                      fontFamily: 'Chiralla'),
                                                ),
                                              );
                                            },
                                          )),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                              top: BorderSide(
                                color: Theme.of(context).colorScheme.onPrimary,
                                width: 2.0,
                              ),
                            )),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: Text(
                                  gridStr[5],
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontFamily: "Chiralla",
                                      fontSize: 20),
                                )),
                                Expanded(
                                    child: Text(weapon.weight.toString(),
                                        style: const TextStyle(
                                            fontFamily: 'Chiralla',
                                            fontSize: 18))),
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
            _space(),
            _space(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                              top: BorderSide(
                                color: Theme.of(context).colorScheme.onPrimary,
                                width: 2.0,
                              ),
                            )),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: TextButton(
                                  onPressed: null,
                                  child: Text(
                                    gridStr[6],
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontFamily: "Chiralla",
                                        fontSize: 20),
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                              top: BorderSide(
                                color: Theme.of(context).colorScheme.onPrimary,
                                width: 2.0,
                              ),
                            )),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: TextButton(
                                        onPressed: null,
                                        child: Text(aow,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface,
                                                fontFamily: "Chiralla",
                                                fontSize: 20,
                                                fontStyle: FontStyle.italic)))),
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
            _space(),
            ElevatedButton(
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
          ],
        ),
      ),
    );
  }
}
