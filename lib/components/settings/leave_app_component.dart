import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Widget presenting an option to exit the application.
///
/// Tapping the ListTile opens a confirmation dialog; if confirmed, the app attempts to exit.
class LeaveAppComponent extends StatefulWidget {
  const LeaveAppComponent({super.key});

  @override
  State<LeaveAppComponent> createState() => _LeaveAppComponentState();
}

class _LeaveAppComponentState extends State<LeaveAppComponent> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.exit_to_app,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      title: Text(
        'Leave App',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Exit App'),
                content: Text('Are you sure you want to exit the app?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      // Attempt to close the app (platform-specific behavior).
                      SystemNavigator.pop();
                    },
                    child: Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('No'),
                  ),
                ],
              );
            });
      },
    );
  }
}
