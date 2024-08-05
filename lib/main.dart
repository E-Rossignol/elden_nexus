import 'package:elden_nexus/firebase/auth/auth.dart';
import 'package:elden_nexus/views/login_register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:elden_nexus/views/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants/locale/locale_string.dart';
import 'constants/theme/theme_provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        home: Auth().currentUser != null ? const WidgetTree(): const LoginPage(),
        theme: Provider.of<ThemeProvider>(context).themeData,);
  }
}