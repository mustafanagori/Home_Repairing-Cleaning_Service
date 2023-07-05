import 'dart:async';

import 'package:contruction0/login.dart';
import 'package:contruction0/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.put(UserController());
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    user != null
        ? Timer(
            const Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (BuildContext context) => Navigation()),
            ),
          )
        : Timer(
            const Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (BuildContext context) => const Login()),
            ),
          );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset('assets/vc1.gif')],
      ),
    );
  }
}
