import 'dart:async';

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'firstpage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserLogin();

  }

  checkUserLogin() async {
    Timer(
      const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) =>FirstPage()),


      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return
        EasySplashScreen(
            logo: Image.asset('assets/Artboard 10.png'),
            logoWidth: 100,
            backgroundColor: Colors.white,
            showLoader: true,
            loaderColor: Colors.black,


            durationInSeconds: 1,




        );
  }
}