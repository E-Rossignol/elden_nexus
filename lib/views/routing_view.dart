import 'package:elden_nexus/views/weapons_page.dart';
import 'package:flutter/material.dart';

import 'dlc/dlc_home_page.dart';
import 'home_page.dart';

class RoutingView extends StatefulWidget {
  const RoutingView({super.key});

  @override
  State<RoutingView> createState() => _RoutingViewState();
}

class _RoutingViewState extends State<RoutingView> with SingleTickerProviderStateMixin {
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
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('Routing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            ListTile(
              title: const Text('Weapons'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WeaponsPage()));
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
                        colors: <Color>[Colors.orangeAccent, Colors.yellow, Colors.red],
                        stops: [
                          _controller.value - 1,
                          _controller.value,
                          _controller.value + 1,
                        ],
                      ).createShader(bounds);
                    },
                    child: const Text(
                      'Shadow of the Erdtree',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  );
                },
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DlcHomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
