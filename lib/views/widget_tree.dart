import 'package:elden_nexus/firebase/auth/auth.dart';
import 'package:elden_nexus/views/home_page.dart';
import 'package:elden_nexus/views/weapons_page.dart';
import 'package:elden_nexus/views/login_register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {

  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
  }

  void checkUserLoggedIn(){
    final user = FirebaseAuth.instance.currentUser;
    if (user != null){
      print(user.toString());
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage(isDlc: false)));
      });
    } else {
      print('No user logged in');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage(isDlc: false)));
            });
            return const WeaponsPage();
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            });
            return const LoginPage();
          }
        });
  }
}