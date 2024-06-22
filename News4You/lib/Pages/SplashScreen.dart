import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:news4you/mainPage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: LottieBuilder.asset(
                "assets/images/news_splash.json",
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "News",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                    ),
                  ),
                  TextSpan(
                    text: "4",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                    ),
                  ),
                  TextSpan(
                    text: "U",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      nextScreen: const Newsapp(),
      duration: 3000,
      backgroundColor: Colors.white,
      splashIconSize: double.infinity,
    );
  }
}
