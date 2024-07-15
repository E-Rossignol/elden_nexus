import 'package:elden_nexus/models/weapon.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Weapon weapon;
  const DetailPage({super.key, required this.weapon});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Weapon weapon = widget.weapon;
    return Dialog(
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        title: Text(weapon.name, style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Mantinia'),),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.scale(
              scale: 0.8,
              child: Image.asset(weapon.image),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Align(alignment: Alignment.centerLeft, child: Text('How to get it:', style: TextStyle(fontWeight: FontWeight.bold))),
                    Text(weapon.howToFind, textAlign: TextAlign.justify),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
