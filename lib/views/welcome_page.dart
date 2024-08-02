import 'package:elden_nexus/views/home_page.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  Widget _space() {
    return const SizedBox(
      height: 20,
    );
  }

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        endDrawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.background,
          child: const SettingsView(),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Elden Nexus", style: TextStyle(fontFamily: "Mantinia")),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                        child: Text(
                          'ELDEN RING',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontFamily: 'Mantinia',
                          ),
                        ),
                      ),
                      onTap: () {
                        Widget toPush = const HomePage(isDlc: false);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => toPush),
                        );
                      },
                    ),
                  ),
                ),
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
                          builder: (BuildContext context, Widget? child) {
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
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  fontFamily: 'Mantinia',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      onTap: () {
                        Widget toPush = const HomePage(isDlc: true);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => toPush),
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
    );
  }
}
