import 'package:elden_nexus/views/routing_view.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:elden_nexus/views/weapons_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/helper.dart';

class HomePage extends StatefulWidget {
  final bool isDlc;
  const HomePage({super.key, required this.isDlc});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String get _title => widget.isDlc ? 'DLC Home' : 'Main Game Home';
  Widget _space(){
    return const SizedBox(
      height: 20,
    );
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
        ], title: Text(_title),
      ),
      body: Column(
        children: [
          _space(),
          const Center(
            child: Text('Welcome to the main page!'),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Theme.of(context).colorScheme.secondary,
              child: ListTile(
                leading: ImageIcon(const AssetImage('lib/constants/icons/weapons_icon.png'), color: Theme.of(context).colorScheme.onSecondary, size: 35,),
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
                leading: ImageIcon(const AssetImage('lib/constants/icons/ash_of_war_icon.png'), color: Theme.of(context).colorScheme.onSecondary, size: 35,),
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
                  Helper.snackbar('Dev', 'This feature is under development.');
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
                leading: ImageIcon(const AssetImage('lib/constants/icons/flask_icon.png'), color: Theme.of(context).colorScheme.onSecondary, size: 35,),
                title: Center(
                  child: Text(
                    'CRACKED TEARS',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontFamily: 'Mantinia',
                    ),
                  ),
                ),
                onTap: () {
                  Helper.snackbar('Dev', 'This feature is under development.');
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
                leading: ImageIcon(const AssetImage('lib/constants/icons/spells_icon.png'), color: Theme.of(context).colorScheme.onSecondary, size: 35,),
                title: Center(
                  child: Text(
                    'SPELLS',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontFamily: 'Mantinia',
                    ),
                  ),
                ),
                onTap: () {
                  Helper.snackbar('Dev', 'This feature is under development.');
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
                leading: ImageIcon(const AssetImage('lib/constants/icons/talisman_icon.png'), color: Theme.of(context).colorScheme.onSecondary, size: 35,),
                title: Center(
                  child: Text(
                    'TALISMANS',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontFamily: 'Mantinia',
                    ),
                  ),
                ),
                onTap: () {
                  Helper.snackbar('Dev', 'This feature is under development.');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
