import 'package:elden_nexus/firebase/database/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elden_nexus/components/settings/change_language_component.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/settings/leave_app_component.dart';

/// SettingsView provides access to language, app exit and developer actions.
///
/// @param isLogin Whether the view is shown in a login flow (unused in current UI).
class SettingsView extends StatefulWidget {
  final bool isLogin;
  const SettingsView({this.isLogin = false, super.key});

  @override
  SettingsViewState createState() => SettingsViewState();
}

/// State for SettingsView, manages SharedPreferences and optional developer buttons.
class SettingsViewState extends State<SettingsView> {
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    // Load SharedPreferences asynchronously.
    SharedPreferences.getInstance().then((value) {
      setState(() {
        prefs = value;
      });
    });
  }

  /// Button to store full DB to Firestore via DatabaseMethods.storeAll().
  /// @return Widget an ElevatedButton wrapped in Padding
  Widget storeButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('STORE'),
              content: Text('ARE YOU SURE TO WANT TO STORE DATA ?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('NO'),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    DatabaseMethods db = DatabaseMethods.instance;
                    await db.storeAll();
                    Get.snackbar('STORE', 'Data stored !');
                  },
                  child: Text('YES'),
                ),
              ],
            ),
          );
        },
        child: Text('STORE'),
      ),
    );
  }

  /// Button to reset SharedPreferences and reinitialize cached data.
  /// @return Widget an ElevatedButton wrapped in Padding
  Widget resetSharedPreferencesButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Reset'),
              content: Text('Reset datas ?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.clear();
                    Get.snackbar('RESET', 'Data reseted !');
                    await DatabaseMethods.instance.initDatas();
                    Get.snackbar('RESET', 'Data re-wrote !');
                  },
                  child: Text('Yes'),
                ),
              ],
            ),
          );
        },
        child: Text('Reset internal datas'),
      ),
    );
  }

  /// Build the settings screen.
  /// @param context BuildContext
  /// @return Widget
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widgets.add(const ChangeLanguageComponent());
    widgets.add(const LeaveAppComponent());
    bool isErwan = prefs?.getBool('isErwan') ?? false;
    if (isErwan) {
      // Developer-only actions are shown when isErwan flag is true.
      widgets.add(storeButton());
      widgets.add(resetSharedPreferencesButton());
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('Settings'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: widgets),
      ),
    );
  }
}
