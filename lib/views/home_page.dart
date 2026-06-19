import 'package:elden_nexus/views/items_views/armor_sets_page.dart';
import 'package:elden_nexus/views/items_views/ashes_of_war_page.dart';
import 'package:elden_nexus/views/items_views/incantations_page.dart';
import 'package:elden_nexus/views/items_views/sorceries_page.dart';
import 'package:elden_nexus/views/items_views/talismans_page.dart';
import 'package:elden_nexus/views/items_views/tears_page.dart';
import 'package:elden_nexus/views/routing_view.dart';
import 'package:elden_nexus/views/settings_view.dart';
import 'package:elden_nexus/views/items_views/weapons_page.dart';
import 'package:elden_nexus/views/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// HomePage shows main navigation cards to item lists.
///
/// @param isDlc Whether the app should show DLC content.
class HomePage extends StatefulWidget {
  final bool isDlc;
  const HomePage({super.key, required this.isDlc});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// State for HomePage, manages animations and navigation.
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  /// Title depending on current mode.
  String get _title => widget.isDlc ? 'Shadow of the Erdtree' : 'Base Game'.tr;

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
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Build the main content of the HomePage.
  ///
  /// @param context BuildContext
  /// @return Widget
  Widget _buildHomePageContent(BuildContext context) {
    return PopScope(
        canPop: true,
        onPopInvoked: (result) {
          // Navigate back to welcome page and clear navigation stack.
          Future.delayed(Duration.zero, () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => WelcomePage(),
              ),
              (route) => false,
            );
          });
        },
        child: Scaffold(
            endDrawer: Drawer(
              backgroundColor: Theme.of(context).colorScheme.background,
              child: SettingsView(),
            ),
            drawer: Drawer(
              backgroundColor: Theme.of(context).colorScheme.background,
              child: const RoutingView(),
            ),
            appBar: AppBar(
              backgroundColor: Colors.black,
              actions: [
                Center(
                  child: IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomePage(),
                        ),
                      );
                    },
                  ),
                ),
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                ),
              ],
              title: widget.isDlc
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (BuildContext context, Widget? child) {
                          // Animated gradient shader to emphasize DLC title.
                          return ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: const <Color>[
                                  Colors.orangeAccent,
                                  Colors.yellow,
                                  Colors.red
                                ],
                                stops: [
                                  _controller.value - 1,
                                  _controller.value,
                                  _controller.value + 1,
                                ],
                              ).createShader(bounds);
                            },
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                _title.toUpperCase(),
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  fontFamily: "Mantinia",
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Text(
                      _title.toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontFamily: "Mantinia",
                        fontSize: 18,
                      ),
                    ),
            ),
            body: Container(
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
                              leading: ImageIcon(
                                const AssetImage(
                                    'lib/constants/icons/weapons_icon.png'),
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                size: 35,
                              ),
                              title: Center(
                                child: Text(
                                  'Weapons'.tr.toUpperCase(),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontFamily: 'Mantinia',
                                  ),
                                ),
                              ),
                              onTap: () {
                                if (!widget.isDlc) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Warning'),
                                        content: Text(
                                            'The ways to find the weapons are not implemented yet.'),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Center(
                                                child: Text('Go anyway')),
                                            onPressed: () {
                                              Widget toPush = WeaponsPage(
                                                  isDlc: widget.isDlc);
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        toPush),
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Warning'),
                                        content: Text(
                                            'DLC weapons requirements and damages are not implemented yet.'),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Center(
                                                child: Text('Go anyway')),
                                            onPressed: () {
                                              Widget toPush = WeaponsPage(
                                                  isDlc: widget.isDlc);
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        toPush),
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
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
                              leading: ImageIcon(
                                const AssetImage(
                                    'lib/constants/icons/talisman_icon.png'),
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                size: 35,
                              ),
                              title: Center(
                                child: Text(
                                  'Talismans'.tr.toUpperCase(),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontFamily: 'Mantinia',
                                  ),
                                ),
                              ),
                              onTap: () {
                                Widget toPush =
                                    TalismansPage(isDlc: widget.isDlc);
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
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Theme.of(context).colorScheme.secondary,
                            child: ListTile(
                              leading: ImageIcon(
                                const AssetImage(
                                    'lib/constants/icons/armor_icon.png'),
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                size: 35,
                              ),
                              title: Center(
                                child: Text(
                                  'Armor'.tr.toUpperCase(),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontFamily: 'Mantinia',
                                  ),
                                ),
                              ),
                              onTap: () {
                                if (!widget.isDlc) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Warning'),
                                        content: Text(
                                            'The armors sets and way to find them are not implemented yet.'),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Center(
                                                child: Text('Go anyway')),
                                            onPressed: () {
                                              Widget toPush = ArmorSetsPage(
                                                  isDlc: widget.isDlc);
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        toPush),
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Warning'),
                                        content: Text(
                                            'The armors sets and way to find them are not implemented yet.'),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Center(
                                                child: Text('Go anyway')),
                                            onPressed: () {
                                              Widget toPush = ArmorSetsPage(
                                                  isDlc: widget.isDlc);
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        toPush),
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
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
                              leading: ImageIcon(
                                const AssetImage(
                                    'lib/constants/icons/ash_of_war_icon.png'),
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                size: 35,
                              ),
                              title: Center(
                                child: Text(
                                  'Ashes of War'.tr.toUpperCase(),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontFamily: 'Mantinia',
                                  ),
                                ),
                              ),
                              onTap: () {
                                Widget toPush =
                                    AshesOfWarPage(isDlc: widget.isDlc);
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
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Theme.of(context).colorScheme.secondary,
                            child: ListTile(
                              leading: ImageIcon(
                                const AssetImage(
                                    'lib/constants/icons/sorceries_icon.png'),
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                size: 35,
                              ),
                              title: Center(
                                child: Text(
                                  'Sorceries'.tr.toUpperCase(),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontFamily: 'Mantinia',
                                  ),
                                ),
                              ),
                              onTap: () {
                                Widget toPush =
                                    SorceriesPage(isDlc: widget.isDlc);
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
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Theme.of(context).colorScheme.secondary,
                            child: ListTile(
                              leading: ImageIcon(
                                const AssetImage(
                                    'lib/constants/icons/incantations_icon.png'),
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                size: 35,
                              ),
                              title: Center(
                                child: Text(
                                  'Incantations'.tr.toUpperCase(),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontFamily: 'Mantinia',
                                  ),
                                ),
                              ),
                              onTap: () {
                                Widget toPush =
                                    IncantationsPage(isDlc: widget.isDlc);
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
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Theme.of(context).colorScheme.secondary,
                            child: ListTile(
                              leading: ImageIcon(
                                const AssetImage(
                                    'lib/constants/icons/flask_icon.png'),
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                size: 35,
                              ),
                              title: Center(
                                child: Text(
                                  'Cracked Tears'.tr.toUpperCase(),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontFamily: 'Mantinia',
                                  ),
                                ),
                              ),
                              onTap: () {
                                if (widget.isDlc) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Warning'),
                                        content: Text(
                                            'DLC tears are not implemented yet.'),
                                        actions: <Widget>[
                                          Center(
                                            child: TextButton(
                                              child:
                                                  Center(child: Text('Back')),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  Widget toPush =
                                      TearsPage(isDlc: widget.isDlc);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => toPush),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return _buildHomePageContent(context);
  }
}
