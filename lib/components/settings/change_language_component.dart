import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Widget that allows the user to change the application's language.
///
/// This widget shows a ListTile which opens a dialog with available languages when tapped.
class ChangeLanguageComponent extends StatefulWidget {
  const ChangeLanguageComponent({super.key});

  @override
  _ChangeLanguageComponent createState() => _ChangeLanguageComponent();
}

/// State for ChangeLanguageComponent.
class _ChangeLanguageComponent extends State<ChangeLanguageComponent> {
  /// Available locales with display names.
  /// Format: {'name': '<displayName>', 'locale': Locale(...)}
  final List locale = [
    {'name': 'Français', 'locale': const Locale('fr')},
    {'name': 'English', 'locale': const Locale('en')},
    {'name': 'Italiano', 'locale': const Locale('it')},
    {'name': 'Deutsch', 'locale': const Locale('de')},
    {'name': 'Español', 'locale': const Locale('es')},
  ];

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        Icons.language,
      ),
      title: Text(
        'languageChange'.tr,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      onTap: () {
        buildDialog(context, locale);
      },
    );
  }
}

/// Show language selection dialog.
///
/// @param context BuildContext where the dialog will be shown.
/// @param locale List of available locales (see _ChangeLanguageComponent.locale).
void buildDialog(BuildContext context, List locale) {
  showDialog(
    context: context,
    builder: (builder) {
      return AlertDialog(
        title: Text(
          'languageChange'.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        content: SizedBox(
          width: double.minPositive,
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    if (locale[index]['name'] != "English") {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'languageChange'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                              ),
                            ),
                            content: Text(
                              'Be careful, other languages than English are not fully implemented yet. Do you want to continue?',
                              style: TextStyle(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  _updateLanguage(locale[index]['locale']);
                                },
                                child: Text(
                                  'Yes',
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onPrimaryContainer,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'close'.tr,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                ),
                              ),
                            ],
                            actionsAlignment: MainAxisAlignment.end,
                          );
                        },
                      );
                    } else {
                      _updateLanguage(locale[index]['locale']);
                    }
                  },
                  child: Text(
                    locale[index]['name'],
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: locale.length,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'close'.tr,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
        actionsAlignment: MainAxisAlignment.end,
      );
    },
  );
}

/// Update application locale using Get.
///
/// @param locale The Locale to switch to.
/// @return void
void _updateLanguage(Locale locale) {
  Get.back();
  Get.updateLocale(locale);
}
