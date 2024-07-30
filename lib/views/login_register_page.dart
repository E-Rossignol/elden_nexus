import 'dart:async';
import 'package:elden_nexus/views/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../firebase/auth/auth.dart';
import '../constants/theme/theme_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage;
  bool isLogin = true;
  bool _isPasswordHidden = true;
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  void setPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _controllerEmail.text = prefs.getString('email') ?? '';
    _controllerPassword.text = prefs.getString('password') ?? '';
  }

  Future<bool> signInWithEmailAndPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      prefs.setString('email', _controllerEmail.text);
      prefs.setString('password', _controllerPassword.text);
      prefs.setBool('autoLogin', true);
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
      return true;
    } on FirebaseAuthException catch (e) {
      setState(() {
        prefs.setBool('autoLogin', false);
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

  Widget _entryField(String title, TextEditingController controller,
      {bool isPassword = false}) {
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

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () async {
        setPreferences();
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
    return isLogin
        ? Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No account yet ?',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface)),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text('Register',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.error)),
                ),
              ],
            ),
          )
        : Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account ?',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface)),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text('Log in',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.error)),
                ),
              ],
            ),
          );
  }

  _signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await Auth().signInWithCredentials(credential);
        Widget toPush = const WelcomePage();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => toPush),
        );
      }
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: 'Error signing in with Google: $e',
        duration: Duration(seconds: 5),
      ));
    }
  }

  Widget _googleWidget() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Or sign in with',
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
          TextButton(
            onPressed: () async {
              await _signInWithGoogle();
            },
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'G',
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  TextSpan(
                    text: 'o',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                  TextSpan(
                    text: 'o',
                    style: TextStyle(color: Colors.yellow, fontSize: 20),
                  ),
                  TextSpan(
                    text: 'g',
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  TextSpan(
                    text: 'l',
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  TextSpan(
                    text: 'e',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
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
            child: const SettingsView(),
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
                  _googleWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
