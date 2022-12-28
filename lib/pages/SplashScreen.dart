import 'dart:async';

import 'package:campus_flutter_uas/pages/HomePage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _CustomSplashscreen();
}

class _CustomSplashscreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 1),
      () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.4,
            width: MediaQuery.of(context).size.width / 1.5,
            child: Image.asset(
              'images/splash.jpeg',
              fit: BoxFit.contain,
            ),
          ),
          const Center()
        ],
      ),
    );
  }
}
