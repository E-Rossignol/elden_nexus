import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:elden_nexus/views/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants/constant.dart';
import 'firebase/auth/auth.dart';
import 'constants/locale/locale_string.dart';
import 'constants/theme/theme_provider.dart';
import 'firebase_options.dart';
import 'models/weapon.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Auth().signOut();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocaleString(),
      locale: const Locale('fr', 'FR'),
      home: const WidgetTree(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
