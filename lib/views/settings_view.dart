// ignore_for_file: prefer_const_constructors

import 'package:elden_nexus/components/settings/log_out_component.dart';
import 'package:elden_nexus/firebase/database/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elden_nexus/components/settings/change_language_component.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/settings/change_password_component.dart';

/// The `SettingsView` class represents the settings view of the application.
///
/// It extends `StatefulWidget` to create a mutable state for this widget.
///
/// The class provides a `build` method which returns a `Scaffold` widget.
/// The `Scaffold` widget has an `AppBar` with a title `Text` widget that displays 'Settings'.
/// The body of the `Scaffold` is a `Padding` widget that contains a `ListView` with `DarkModeSwitchComponent`, `ChangeLanguageComponent`, and `LogOutComponent` components.
class SettingsView extends StatefulWidget {
  final bool isLogin;
  SettingsView({this.isLogin = false, super.key});


  @override
  SettingsViewState createState() => SettingsViewState();
}

/// The `_SettingsViewState` class represents the mutable state for the `SettingsView` widget.
///
/// It extends `State<SettingsView>` to create a mutable state for the `SettingsView` widget.
///
/// The class provides a `build` method which returns a `Scaffold` widget.
/// The `Scaffold` widget has an `AppBar` with a title `Text` widget that displays 'Settings'.
/// The body of the `Scaffold` is a `Padding` widget that contains a `ListView` with `DarkModeSwitchComponent`, `ChangeLanguageComponent`, and `LogOutComponent` components.
class SettingsViewState extends State<SettingsView> {
  SharedPreferences? prefs;
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      setState(() {
        prefs = value;
      });
    });
  }

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
                          DatabaseMethods db = DatabaseMethods.instance;
                          await db.storeAll();
                        },
                        child: Text('YES'),
                      ),
                    ],
                  ));
        },
        child: Text('store'.tr),
      ),
    );
  }

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
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.clear();
                          Get.snackbar('RESET', 'Data reseted !');
                          Navigator.of(context).pop();
                        },
                        child: Text('Yes'),
                      ),
                    ],
                  ));
        },
        child: Text('Reset internal datas'),
      ),
    );
  }

  Widget rewriteSharedPreferencesButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () async {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Rewrite'),
                    content: Text('Rewrite datas ?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('No'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await DatabaseMethods.instance.initDatas();
                          Get.snackbar('RESET', 'Data re-wrote !');
                          Navigator.of(context).pop();
                        },
                        child: Text('Yes'),
                      ),
                    ],
                  ));
        },
        child: Text('Rewrite internal datas'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widgets.add(const ChangeLanguageComponent());
    if (!widget.isLogin)
      widgets.add(const ChangePasswordComponent());
    widgets.add(const LogOutComponent());
    bool isErwan = prefs?.getBool('isErwan') ?? false;
    if (isErwan){
      widgets.add(storeButton());
      widgets.add(resetSharedPreferencesButton());
      widgets.add(rewriteSharedPreferencesButton());
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: widgets,
        ),
      ),
    );
  }
}
