import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'dart:async';


import 'package:snake_game/home_page.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with  SingleTickerProviderStateMixin{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient:  LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
            colors: [Colors.purple,Colors.orange]
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Lottie.asset('assets/21534-wallet-icon.json',
          ),
        ),
      ),
    );
  }
}
