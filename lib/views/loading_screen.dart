import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'lib/constants/images/app/background.jpeg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                ),
                SpinKitCubeGrid(
                  color: Theme.of(context).colorScheme.primary,
                  size: 50.0,
                ),
                const SizedBox(height: 20),
                Text(
                  "Loading".tr.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Mantinia',
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
