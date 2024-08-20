import 'package:elden_nexus/models/talisman.dart';
import 'package:elden_nexus/views/items_views/talismans_page.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TalismanDetailPage extends StatefulWidget {
  final Talisman tal;
  const TalismanDetailPage({super.key, required this.tal});

  @override
  State<TalismanDetailPage> createState() => _TalismanDetailPageState();
}

class _TalismanDetailPageState extends State<TalismanDetailPage> {
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

  List<TextSpan> _buildTextSpans(String text) {
    RegExp regExp = RegExp(r'\d+\w?|%|\+'); // Matches any number
    List<TextSpan> spans = [];
    text.splitMapJoin(
      regExp,
      onMatch: (m) {
        spans.add(TextSpan(
            text: m.group(0)!,
            style: const TextStyle(color: Colors.redAccent)));
        return m.group(0)!;
      },
      onNonMatch: (n) {
        spans.add(TextSpan(text: n));
        return n;
      },
    );
    return spans;
  }

  Widget buildRichText(String text) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            style: const TextStyle(fontSize: 20, fontFamily: 'Chiralla'),
            children: _buildTextSpans(text)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Talisman tal = widget.tal;
    String url = tal.mapLink;
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return TalismansPage(isDlc: widget.tal.image.contains("dlc"));
                }));
              },
            );
          }),
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
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Center(
              child: Text(
                tal.name.replaceAll("+", "plus ").toUpperCase(),
                style: const TextStyle(fontFamily: 'Mantinia', fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
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
                  _space(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Transform.scale(
                      scale: 0.8,
                      child: Image.asset(tal.image),
                    ),
                  ),
                  _space(),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: SingleChildScrollView(
                        child: buildRichText(
                          tal.effect,
                        ),
                      )),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: SingleChildScrollView(
                        child: Text(
                          tal.description,
                          style: const TextStyle(
                              fontSize: 18, fontStyle: FontStyle.italic),
                          textAlign: TextAlign.justify,
                        ),
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
                              title: Text('How to get ${tal.name}:'),
                              content: SingleChildScrollView(
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(tal.howToFind)),
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
