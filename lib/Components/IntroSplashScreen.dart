import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
// import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:scoreboard/main.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

//Intro
class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'image/scoreboard.png',
              height: 130,
            ),
            const SizedBox(
              height: 30,
            ),
            if (Platform.isAndroid)
              const CupertinoActivityIndicator(
                radius: 20,
              )
            else
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            const Text(
              '\nMultipurpose IoT Scoreboard App',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
} //Intro

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       splash: Column(
//         children: [
//           Image.asset('image/scoreboard.png'),
//           const Text(
//             'Multipurpose IoT Scoreboard App',
//             style: TextStyle(
//                 fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
//           )
//         ],
//       ),
//       backgroundColor: Colors.white,
//       nextScreen: const MyHomePage(),
//       splashIconSize: 700,
//       duration: 2000,
//       splashTransition: SplashTransition.fadeTransition,
//       pageTransitionType: PageTransitionType.rightToLeftWithFade,
//     );
//   }
// }