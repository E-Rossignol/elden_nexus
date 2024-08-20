import 'dart:async';
import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/views/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../firebase/auth/auth.dart';
import '../constants/theme/theme_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SharedPreferences? prefs;
  String? errorMessage;
  bool isLogin = true;
  bool _isPasswordHidden = true;
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    initValues();
    SharedPreferences.getInstance().then((value) {
        prefs = value;
    });
  }

  void initValues() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _controllerEmail.text = prefs?.getString('username') ?? '';
      _controllerPassword.text = prefs?.getString('password') ?? '';
    });
  }

  Future<bool> signInWithEmailAndPassword() async {
    String code = await DatabaseMethods.instance.getCheckCode();
    String storageCode = await const FlutterSecureStorage().read(key: 'token') ?? '';
    if (code != storageCode){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text('This app is not available for public use. Please contact the developer for more information.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),);
      return false;
    }
    prefs?.setString('username', _controllerEmail.text);
    prefs?.setString('password', _controllerPassword.text);
    if (Auth().currentUser != null) {
      await Auth().signOut();
      return false;
    }
    try {
      if (_controllerEmail.text == "erwan@hotmail.ch"){
        await Auth().signInWithEmailAndPassword(
            email: _controllerEmail.text, password: _controllerPassword.text);
        return true;
      }
      else if (!isValidUserName(_controllerEmail.text)) {
        setState(() {
          errorMessage = 'Username is not valid:';
        });
        return false;
      }
      String email = "${_controllerEmail.text.toLowerCase()}@gmail.com";
      if (_controllerEmail.text == "erwan@hotmail.ch"){
        email = _controllerEmail.text;
      }
      await Auth().signInWithEmailAndPassword(
          email: email, password: _controllerPassword.text);

      return true;
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
      return false;
    }
  }

  bool isValidUserName(String email) {
    // Rule 1: Be at least one character long.
    if (email.isEmpty) {
      setState(() {
        errorMessage = 'Username is too short';
      });
      return false;
    }

    // Rule 2: Start and end with a letter or number.
    if (!RegExp(r'^[a-zA-Z0-9].*[a-zA-Z0-9]$').hasMatch(email)) {
      setState(() {
        errorMessage = 'Username must start and end with a letter or number';
      });
      return false;
    }

    // Rule 3: Can include periods (.) as long as they are not the first or last character, and provided that they do not appear consecutively.
    if (RegExp(r'\.\.').hasMatch(email) || email.startsWith('.') || email.endsWith('.')) {
      setState(() {
        errorMessage = 'Invalid use of periods in username';
      });
      return false;
    }

    // Rule 4: Can contain these special characters: ! # $ % & ' * + - / = ? ^ _ ` { | } ~
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(email)) {
        setState(() {
    errorMessage = 'Use only letters and numbers in username';
    });
    return false;
  }
  // If all checks pass, the username is valid
  return true;
}

  Future<bool> createUserWithEmailAndPassword() async {
    if (Auth().currentUser != null) {
      await Auth().signOut();
    }
    try {
      if (!isValidUserName(_controllerEmail.text)) {
        setState(() {
          errorMessage = 'Username is not valid:';
        });
        return false;
      }
      String email = "${_controllerEmail.text.toLowerCase()}@gmail.com";
      await Auth().createUserWithEmailAndPassword(
          email: email, password: _controllerPassword.text);
      await Auth().signInWithEmailAndPassword(email: email, password: _controllerPassword.text);
      return true;
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message?.replaceAll("email address ", "username");
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
      style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 22),
      controller: controller,
      obscureText: isPassword ? _isPasswordHidden : false,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 20),
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
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await Auth().signInWithCredentials(credential);
        Widget toPush = const WelcomePage();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => toPush),
        );
      }
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: 'Error signing in with Google: $e',
        duration: const Duration(seconds: 5),
      ));
    }
  }

  Widget _googleWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Or sign in with',
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
          ElevatedButton(
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
    bool isErwan = prefs?.getBool('isErwan') ?? false;
    ColorScheme colors = Theme.of(context).colorScheme;
    return PopScope(
      canPop: false,
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
                backgroundColor: Colors.black, actions: [
              Builder(
                  builder: (context) => IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: Icon(
                          color: colors.primary,
                          Icons.settings,
                        ),
                      )),
            ]),
            endDrawer: Drawer(
              backgroundColor: colors.background,
              child: SettingsView(),
            ),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/constants/images/app/app_background.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
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
                    if (isErwan)
                      _justLogIn(),
                    _entryField('Username', _controllerEmail),
                    _entryField('Password', _controllerPassword,
                        isPassword: true),
                    _errorMessage(),
                    _submitButton(),
                    const SizedBox(height: 30),
                    _loginOrRegisterButton(),
                    const SizedBox(height: 30),
                    _googleWidget(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
