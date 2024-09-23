import 'package:batch3/firebase/home_screen.dart';
import 'package:batch3/firebase/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, data) {
          if(data.hasData)
          {
            return HomeScreen();
          }
          else
          {
            return LoginScreen();
          }
        })
    );
  }
}