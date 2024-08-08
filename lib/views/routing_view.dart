// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'items_views/armors_page.dart';
import 'items_views/incantations_page.dart';
import 'items_views/sorceries_page.dart';
import 'items_views/tears_page.dart';
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
                'Base Game'.toUpperCase(),
                style: TextStyle(
                  fontFamily: "Mantinia",
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const TalismansPage(isDlc: false)),
                      );
                      break;
                    case 'Armor':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ArmorsPage(isDlc: false)),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const TearsPage(isDlc: false)),
                      );
                      break;
                    case 'Sorceries':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SorceriesPage(isDlc: false)),
                      );
                      break;
                    case 'Incantations':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const IncantationsPage(isDlc: false)),
                      );
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
                      'Shadow of the Erdtree'.toUpperCase(),
                      style: TextStyle(
                        fontFamily: "Mantinia",
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 17,
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
                        MaterialPageRoute(
                            builder: (context) =>
                                const ArmorsPage(isDlc: true)),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TearsPage(isDlc: true)),
                      );
                      break;
                    case 'Sorceries':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SorceriesPage(isDlc: true)),
                      );
                      break;
                    case 'Incantations':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const IncantationsPage(isDlc: true)),
                      );
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
              onLongPress: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                bool isErwan = prefs.getBool('isErwan') ?? false;
                if (!isErwan){
                  await prefs.setBool('isErwan', true);
                  setState(() {
                    Get.snackbar('Erwan', 'Erwan is now unlocked');
                  });
                } else {
                  await prefs.setBool('isErwan', false);
                  setState(() {
                    Get.snackbar('Erwan', 'Erwan is now locked');
                  });
                }

              },
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