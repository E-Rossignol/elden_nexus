import 'package:elden_nexus/constants/helper.dart';
import 'package:elden_nexus/firebase/database/database.dart';
import 'package:elden_nexus/views/home_page.dart';
import 'package:elden_nexus/views/loading_screen.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// WelcomePage performs initial checks and allows selection between Base Game and DLC.
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

/// State for WelcomePage, manages initialization and token checks.
class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  /// Small vertical spacer widget.
  Widget _space() {
    return const SizedBox(
      height: 20,
    );
  }

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    initGodMod();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
  }

  /// Clear developer flag at app start.
  /// @return Future<void>
  Future<void> initGodMod() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isErwan');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Build welcome page UI depending on tokenOk.
  /// @param context BuildContext
  /// @param tokenOk whether DB token check passed
  /// @return Widget
  Widget _buildWelcomePage(BuildContext context, bool tokenOk) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        endDrawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.background,
          child: const SettingsView(),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("ELDEN NEXUS",
              style: TextStyle(fontFamily: "Mantinia")),
        ),
        body: tokenOk
            ? Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'lib/constants/images/app/app_background.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _space(),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 100, 10, 10),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Theme.of(context).colorScheme.secondary,
                              child: ListTile(
                                title: Center(
                                  child: Text(
                                    'Base Game'.tr.toUpperCase(),
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                      fontFamily: 'Mantinia',
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Widget toPush = const HomePage(isDlc: false);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => toPush),
                                  );
                                },
                              ),
                            ),
                          ),
                          _space(),
                          _space(),
                          Container(
                            margin: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Theme.of(context).colorScheme.secondary,
                              child: ListTile(
                                title: Center(
                                  child: AnimatedBuilder(
                                    animation: _controller,
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return ShaderMask(
                                        shaderCallback: (Rect bounds) {
                                          return LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: const <Color>[
                                              Color.fromRGBO(139, 0, 0, 1),
                                              Color.fromRGBO(165, 42, 42, 1),
                                              Color.fromRGBO(178, 34, 34, 1),
                                            ],
                                            stops: [
                                              _controller.value - 1,
                                              _controller.value,
                                              _controller.value + 1,
                                            ],
                                          ).createShader(bounds);
                                        },
                                        child: Text(
                                          "SHADOW OF THE ERDTREE",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary,
                                            fontFamily: 'Mantinia',
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                onTap: () {
                                  Widget toPush = const HomePage(isDlc: true);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => toPush),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : PopScope(
                canPop: false,
                child: AlertDialog(
                  title: Text("error".tr),
                  content: Text(
                      'You have a bad version of the app, please contact developer for new version.'
                          .tr),
                  actions: [
                    TextButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Text("OK".tr),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DatabaseMethods db = DatabaseMethods.instance;
    // Check internet availability before initializing DB; this controls token check flow.
    return FutureBuilder(
        future: Helper.isInternetAvailable(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: LoadingScreen(),
              ),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("Error: ${snapshot.error}"),
              ),
            );
          } else {
            return snapshot.data!
                ? FutureBuilder(
                    future: db.initDatas(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Scaffold(
                          body: Center(
                            child: LoadingScreen(),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Scaffold(
                          body: Center(
                            child: Text("Error: ${snapshot.error}"),
                          ),
                        );
                      } else {
                        return _buildWelcomePage(context, snapshot.data!);
                      }
                    })
                : PopScope(
                    canPop: false,
                    child: AlertDialog(
                      title: Center(
                          child: Text("Internet connection required".tr)),
                      content: Center(
                          child: Text(
                              "You need an internet connection to access the app."
                                  .tr)),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {});
                          },
                          child: Text("Retry".tr),
                        ),
                      ],
                    ),
                  );
          }
        });
  }
}
