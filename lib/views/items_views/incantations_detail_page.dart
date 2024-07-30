import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/incantation.dart';

class IncantationDetailPage extends StatefulWidget {
  final Incantation incant;

  const IncantationDetailPage({super.key, required this.incant});

  @override
  State<IncantationDetailPage> createState() => _IncantationDetailPageState();
}

class _IncantationDetailPageState extends State<IncantationDetailPage> {
  Widget _space() {
    return const SizedBox(
      height: 20,
      width: 10,
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  String requirement(double input) {
    if (input == 0) {
      return "-";
    }
    return input.toInt().toString();
  }

  @override
  Widget build(BuildContext context) {
    double defaultHeight = 60;
    String fpCost = "FP Cost: ${widget.incant.fPCost.toInt()}";
    String slots = "Slots: ${widget.incant.slots}";
    Incantation inc = widget.incant;
    String url = inc.mapLink;
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
            inc.name.toUpperCase(),
            style: const TextStyle(fontFamily: 'Mantinia', fontSize: 16),
            maxLines: 1,
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                _space(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Transform.scale(
                    scale: 0.8,
                    child: Image.asset(inc.image),
                  ),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            fpCost,
                            style: const TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Chiralla'),
                          ),
                          Text(
                            slots,
                            style: const TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Chiralla'),
                          ),
                        ],
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: SingleChildScrollView(
                      child: Text(
                        inc.description,
                        style: const TextStyle(
                            fontSize: 18, fontStyle: FontStyle.italic),
                        textAlign: TextAlign.justify,
                      ),
                    )),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25 - 60,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Table(
                      columnWidths: {
                        0: FlexColumnWidth(
                            0.5), // First column is half the size
                        1: FlexColumnWidth(1),
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
                                  color:
                                      Theme.of(context).colorScheme.secondary,
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
                                  color:
                                      Theme.of(context).colorScheme.secondary,
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
                                        child: Text(
                                            requirement(inc.requirement.int),
                                            style: TextStyle(
                                                color: inc.requirement.int != 0
                                                    ? Colors.redAccent
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
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                              child: Center(
                                  child: Container(
                                      height: defaultHeight,
                                      child: Center(
                                          child: Text("FAI",
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
                                          child: Text(
                                              requirement(inc.requirement.fai),
                                              style: TextStyle(
                                                  color: inc.requirement.fai !=
                                                          0
                                                      ? Colors.redAccent
                                                      : Theme.of(context)
                                                          .colorScheme
                                                          .onSecondaryContainer))))),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
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
                                          child: Text(
                                              requirement(inc.requirement.arc),
                                              style: TextStyle(
                                                  color: inc.requirement.arc !=
                                                          0
                                                      ? Colors.redAccent
                                                      : Theme.of(context)
                                                          .colorScheme
                                                          .onSecondaryContainer))))),
                            ),
                          ],
                        ),
                      ],
                    )),
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
                            title: Text('How to get ${inc.name}:'),
                            content: SingleChildScrollView(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(inc.howToFind)),
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
    );
  }
}
