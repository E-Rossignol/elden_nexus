import 'package:elden_nexus/models/ash_of_war.dart';
import 'package:elden_nexus/models/weapon.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/helper.dart';

class DetailPage extends StatefulWidget {
  final Weapon weapon;

  const DetailPage({super.key, required this.weapon});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Widget _space() {
    return const SizedBox(
      height: 10,
    );
  }

  void _launchURL(String url) async {
    if (url == 'Default Link'){
      Helper.snackbar('Oops', 'No link available yet !');
    }
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Weapon weapon = widget.weapon;
    String isSomberStr = weapon.isSomber ? 'Somber Smithing Stones' : 'Smithing Stones';
    List<String> gridStr = ['STR', 'DEX', 'INT', 'FAI', 'ARC', 'Weight', 'Ash of War:'];
    List<String> scalingStr = [
      weapon.scaling.str,
      weapon.scaling.dex,
      weapon.scaling.int,
      weapon.scaling.fai,
      weapon.scaling.arc,
    ];
    AshOfWar aow = weapon.ashOfWar;
    String url = weapon.mapLink;
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
    linkWidgets.add(
      TextButton(
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
              height: MediaQuery.of(context).size.height * 0.3,
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
                      style: const TextStyle(fontFamily: 'Chiralla', fontSize: 18),
                      maxLines: 1,
                    ),
                    Text(isSomberStr, style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic, fontFamily: 'Chiralla'),),
                  ],
                ),
              )
            ),
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary,
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
                                    child: Text(scalingStr[0],
                                        style: TextStyle(
                                          color: Theme.of(context).colorScheme.onSurface,
                                            fontFamily: 'Chiralla',
                                            fontSize: 18))),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary,
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
                                          color: Theme.of(context).colorScheme.onSurface,
                                          fontFamily: "Chiralla", fontSize: 20),
                                    )),
                                Expanded(
                                    child: Text(scalingStr[1],
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary,
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
                                          color: Theme.of(context).colorScheme.onSurface,
                                          fontFamily: "Chiralla", fontSize: 20),
                                    )),
                                Expanded(
                                    child: Text(scalingStr[2],
                                        style: const TextStyle(
                                            fontFamily: 'Chiralla',
                                            fontSize: 18))),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary,
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
                                          color: Theme.of(context).colorScheme.onSurface,
                                          fontFamily: "Chiralla", fontSize: 20),
                                    )),
                                Expanded(
                                    child: Text(scalingStr[3],
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary,
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
                                          color: Theme.of(context).colorScheme.onSurface,
                                          fontFamily: "Chiralla", fontSize: 20),
                                    )),
                                Expanded(
                                    child: Text(scalingStr[4],
                                        style: const TextStyle(
                                            fontFamily: 'Chiralla',
                                            fontSize: 18))),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary,
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
                                          color: Theme.of(context).colorScheme.onSurface,
                                          fontFamily: "Chiralla", fontSize: 20),
                                    )),
                                Expanded(
                                    child: Text(scalingStr[5],
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary,
                                    width: 2.0,
                                  ),
                                )),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: Text(
                                  gridStr[6],
                                  style: TextStyle(
                                      color: Theme.of(context).colorScheme.onSurface,
                                      fontFamily: "Chiralla", fontSize: 20),
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary,
                                    width: 2.0,
                                  ),
                                )),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: Text(aow.name,
                                        style: TextStyle(
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
                              mainAxisAlignment: MainAxisAlignment.end,
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
