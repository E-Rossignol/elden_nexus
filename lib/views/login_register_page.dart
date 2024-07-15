import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../firebase/auth/auth.dart';
import '../constants/theme/theme_provider.dart';
import 'weapons_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  String? errorMessage;
  bool isLogin = true;
  bool _isPasswordHidden = true;
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void initState() {
    setPreferences();
    super.initState();
  }

  void setPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _controllerEmail.text = prefs.getString('email') ?? '';
    _controllerPassword.text = prefs.getString('password') ?? '';
  }

  Future<bool> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
      return true;
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
      return false;
    }
  }

  Future<bool> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
      return true;
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
      return false;
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  Widget _entryField(String title, TextEditingController controller, {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? _isPasswordHidden : false,
      decoration: InputDecoration(
        labelText: title,
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(_isPasswordHidden
              ? Icons.visibility
              : Icons.visibility_off),
          onPressed: _togglePasswordVisibility,
        )
            : null,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(
      errorMessage ?? '',
    );
  }

  Widget _space() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
    );
  }

  Widget _title() {
    return Text(
      'ELDEN NEXUS',
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 40,
        fontFamily: 'Mantinia',
      ),
    );
  }

  void goToMainPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WeaponsPage()));
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () async {
        isLogin
            ? await signInWithEmailAndPassword()
            : await createUserWithEmailAndPassword();
      },
      child: Text(isLogin ? 'logIn' : 'register'),
    );
  }

  Widget _justLogIn() {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            _controllerEmail.text = 'erwan@hotmail.ch';
            _controllerPassword.text = 'testtest';
          });
        },
        child: Text('Just fckin log me in',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface)));
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
        onPressed: () {
          setState(() {
            isLogin = !isLogin;
          });
        },
        child: Text(isLogin ? 'register' : 'logIn',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface)));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: AppBar(backgroundColor: colors.primary, actions: [
            Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(
                    color: colors.onPrimary,
                    Icons.settings,
                  ),
                )),
          ]),
          endDrawer: Drawer(
            backgroundColor: colors.background,
            child: SettingsView(),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _space(),
                  _title(),
                  _space(),
                  _justLogIn(),
                  _entryField('Email', _controllerEmail),
                  _entryField('Password', _controllerPassword,
                      isPassword: true),
                  _errorMessage(),
                  _submitButton(),
                  _loginOrRegisterButton(),
                  _space(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}