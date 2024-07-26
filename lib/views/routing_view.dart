import 'items_views/armors_page.dart';
import 'items_views/weapons_page.dart';
import 'package:flutter/material.dart';
import 'items_views/ashes_of_war_page.dart';
import 'items_views/talismans_page.dart';
import 'home_page.dart';

class RoutingView extends StatefulWidget {
  const RoutingView({super.key});

  @override
  State<RoutingView> createState() => _RoutingViewState();
}

class _RoutingViewState extends State<RoutingView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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

  @override
  Widget build(BuildContext context) {
    String selectedRoute = "Weapons";
    String selectedRouteDlc = "Weapons";
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('Maps'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ListTile(
              title: Text(
                'Elden Ring',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 20,
                ),
              ),
              trailing: PopupMenuButton<String>(
                onSelected: (newValue) {
                  setState(() {
                    selectedRoute = newValue;
                  });
                  switch (selectedRoute) {
                    case 'Weapons':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const WeaponsPage(isDlc: false)),
                      );
                      break;
                    case 'Talismans':
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Coming Soon'),
                              content: const Text(
                                  'Talismans are not available yet.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          });
                      break;
                    case 'Armor':
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ArmorsPage(isDlc: false)),
                      );
                      break;
                    case 'Ashes of War':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const AshesOfWarPage(isDlc: false)),
                      );
                      break;
                    case 'Cracked Tears':
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Coming Soon'),
                              content: const Text(
                                  'Cracked Tears are not available yet.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          });
                      break;
                    case 'Sorceries':
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Coming Soon'),
                              content: const Text(
                                  'Sorceries are not available yet.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          });
                      break;
                    case 'Incantations':
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Coming Soon'),
                              content: const Text(
                                  'Incantations are not available yet.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          });
                      break;
                  }
                },
                itemBuilder: (BuildContext context) {
                  return <String>[
                    'Weapons',
                    'Talismans',
                    'Armor',
                    'Ashes of War',
                    'Sorceries',
                    'Incantations',
                    'Cracked Tears'
                  ].map((String value) {
                    return PopupMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList();
                },
              ),
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomePage(isDlc: false)),
                  );
                });
              },
            ),
            ListTile(
              title: AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) {
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
                      'Shadow of the Erdtree',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 20,
                      ),
                    ),
                  );
                },
              ),
              trailing: PopupMenuButton<String>(
                onSelected: (newValue) {
                  setState(() {
                    selectedRouteDlc = newValue;
                  });
                  switch (selectedRouteDlc) {
                    case 'Weapons':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const WeaponsPage(isDlc: true)),
                      );
                      break;
                    case 'Armor':
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ArmorsPage(isDlc: true)),
                      );
                      break;
                    case 'Talismans':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const TalismansPage(isDlc: true)),
                      );
                      break;
                    case 'Ashes of War':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AshesOfWarPage(
                                  isDlc: true,
                                )),
                      );
                      break;
                    case 'Cracked Tears':
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Coming Soon'),
                              content: const Text(
                                  'Cracked Tears are not available yet.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          });
                      break;
                    case 'Sorceries':
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Coming Soon'),
                              content: const Text(
                                  'Sorceries are not available yet.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          });
                      break;
                    case 'Incantations':
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Coming Soon'),
                              content: const Text(
                                  'Incantations are not available yet.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          });
                      break;
                  }
                },
                itemBuilder: (BuildContext context) {
                  return <String>[
                    'Weapons',
                    'Talismans',
                    'Armor',
                    'Ashes of War',
                    'Sorceries',
                    'Incantations',
                    'Cracked Tears'
                  ].map((String value) {
                    return PopupMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList();
                },
              ),
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomePage(isDlc: true)),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
