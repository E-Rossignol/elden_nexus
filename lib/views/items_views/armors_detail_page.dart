import 'package:elden_nexus/models/armor.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ArmorDetailPage extends StatefulWidget {
  final Armor armor;

  const ArmorDetailPage({super.key, required this.armor});

  @override
  State<ArmorDetailPage> createState() => _ArmorDetailPageState();
}

class _ArmorDetailPageState extends State<ArmorDetailPage> {
  Widget _space() {
    return const SizedBox(
      height: 10,
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
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
            armor.name.toUpperCase(),
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
                child: Image.asset(armor.image),
              ),
            ),
            _space(),
            Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.45,
                child: SingleChildScrollView(
                  child: Text(
                    armor.armorPiece.toString(),
                    style: const TextStyle(
                        fontSize: 18, fontStyle: FontStyle.italic),
                    textAlign: TextAlign.justify,
                  ),
                )),
            ElevatedButton(
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
          ],
        ),
      ),
    );
  }
}
