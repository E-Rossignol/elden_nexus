import 'package:elden_nexus/components/settings/log_out_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elden_nexus/components/settings/change_language_component.dart';

/// The `SettingsView` class represents the settings view of the application.
///
/// It extends `StatefulWidget` to create a mutable state for this widget.
///
/// The class provides a `build` method which returns a `Scaffold` widget.
/// The `Scaffold` widget has an `AppBar` with a title `Text` widget that displays 'Settings'.
/// The body of the `Scaffold` is a `Padding` widget that contains a `ListView` with `DarkModeSwitchComponent`, `ChangeLanguageComponent`, and `LogOutComponent` components.
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widgets.add(const ChangeLanguageComponent());
    widgets.add(const LogOutComponent());
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('settings'.tr),
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
