import 'package:elden_nexus/views/ashes_of_war_page.dart';
import 'package:elden_nexus/views/routing_view.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:elden_nexus/views/weapons_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  final bool isDlc;
  const HomePage({super.key, required this.isDlc});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String get _title =>
      widget.isDlc ? 'Shadow of the Erdtree Home' : 'Elden Ring Home';
  Widget _space() {
    return const SizedBox(
      height: 20,
    );
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: const SettingsView(),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: const RoutingView(),
      ),
      appBar: AppBar(
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
        title: widget.isDlc
            ? AnimatedBuilder(
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
                      _title,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 20,
                      ),
                    ),
                  );
                },
              )
            : Text(_title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _space(),
              Container(
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                  child: ListTile(
                    leading: ImageIcon(
                      const AssetImage('lib/constants/icons/weapons_icon.png'),
                      color: Theme.of(context).colorScheme.onSecondary,
                      size: 35,
                    ),
                    title: Center(
                      child: Text(
                        'WEAPONS',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontFamily: 'Mantinia',
                        ),
                      ),
                    ),
                    onTap: () {
                      Widget toPush = WeaponsPage(isDlc: widget.isDlc);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => toPush),
                      );
                    },
                  ),
                ),
              ),
              _space(),
              Container(
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                  child: ListTile(
                    leading: ImageIcon(
                      const AssetImage('lib/constants/icons/talisman_icon.png'),
                      color: Theme.of(context).colorScheme.onSecondary,
                      size: 35,
                    ),
                    title: Center(
                      child: Text(
                        'TALISMANS',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontFamily: 'Mantinia',
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              _space(),
              Container(
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                  child: ListTile(
                    leading: ImageIcon(
                      const AssetImage(
                          'lib/constants/icons/ash_of_war_icon.png'),
                      color: Theme.of(context).colorScheme.onSecondary,
                      size: 35,
                    ),
                    title: Center(
                      child: Text(
                        'ASH OF WAR',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontFamily: 'Mantinia',
                        ),
                      ),
                    ),
                    onTap: () {
                      Widget toPush = AshesOfWarPage(isDlc: widget.isDlc);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => toPush),
                      );
                    },
                  ),
                ),
              ),
              _space(),
              Container(
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                  child: ListTile(
                    leading: ImageIcon(
                      const AssetImage('lib/constants/icons/flask_icon.png'),
                      color: Theme.of(context).colorScheme.onSecondary,
                      size: 35,
                    ),
                    title: Center(
                      child: Text(
                        'CRACKED TEARS',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontFamily: 'Mantinia',
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              _space(),
              Container(
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                  child: ListTile(
                    leading: ImageIcon(
                      const AssetImage(
                          'lib/constants/icons/sorceries_icon.png'),
                      color: Theme.of(context).colorScheme.onSecondary,
                      size: 35,
                    ),
                    title: Center(
                      child: Text(
                        'SORCERIES',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontFamily: 'Mantinia',
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              _space(),
              Container(
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                  child: ListTile(
                    leading: ImageIcon(
                      const AssetImage(
                          'lib/constants/icons/incantations_icon.png'),
                      color: Theme.of(context).colorScheme.onSecondary,
                      size: 35,
                    ),
                    title: Center(
                      child: Text(
                        'INCANTATIONS',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontFamily: 'Mantinia',
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
