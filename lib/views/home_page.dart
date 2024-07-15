import 'package:elden_nexus/views/weapons_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mainPageTitle'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('Welcome to the main page!'),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.5,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Theme.of(context).colorScheme.secondary,
              child: ListTile(
                leading: Icon(Icons.sports_hockey, color: Theme.of(context).colorScheme.onSecondary),
                title: Center(
                  child: Text(
                    'Weapons',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontFamily: 'Mantinia',
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WeaponsPage()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
