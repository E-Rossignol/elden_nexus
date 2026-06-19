import 'package:elden_nexus/constants/helper.dart';
import 'package:elden_nexus/views/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants/locale/locale_string.dart';
import 'constants/theme/theme_provider.dart';
import 'firebase_options.dart';

/// Application entry point.
///
/// Initializes Firebase and helper data, then starts the Flutter app.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Helper.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MyApp(),
  ));
}

/// Root widget of the application.
///
/// Provides GetMaterialApp configuration, translations and theme integration.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Build the root GetMaterialApp.
  ///
  /// @param context BuildContext
  /// @return Widget
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: const Locale('en', 'EN'),
      home: const WelcomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/welcome': (context) => const WelcomePage(),
      },
    );
  }
}
