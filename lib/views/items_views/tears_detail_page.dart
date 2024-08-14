import 'package:elden_nexus/models/tear.dart';
import 'package:elden_nexus/views/items_views/tears_page.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TearDetailPage extends StatefulWidget {
  final Tear tear;
  const TearDetailPage({super.key, required this.tear});

  @override
  State<TearDetailPage> createState() => _TearDetailPageState();
}

class _TearDetailPageState extends State<TearDetailPage> {
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
    RegExp regExp = RegExp(r'\d+|%|\+'); // Matches any number
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
    Tear tear = widget.tear;
    String url = tear.mapLink;
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
                  return TearsPage(isDlc: widget.tear.image.contains("dlc"));
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
              tear.name.toUpperCase(),
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
                  _space(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Transform.scale(
                      scale: 0.8,
                      child: Image.asset(tear.image),
                    ),
                  ),
                  _space(),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: SingleChildScrollView(
                        child: buildRichText(
                          tear.effect,
                        ),
                      )),
                  if (tear.duration != 0)
                    Container(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: SingleChildScrollView(
                          child:
                              buildRichText("Lasts ${tear.duration} seconds"),
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
                          title: Text('How to get ${tear.name}:'),
                          content: SingleChildScrollView(
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(tear.howToFind)),
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
