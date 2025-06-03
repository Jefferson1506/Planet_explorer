import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';

class SplashSolarTheme extends StatelessWidget {
  const SplashSolarTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashTransition: SplashTransition.fadeTransition,
      nextScreen: const HomePage(), // Página siguiente
      duration: 4000,
      splashIconSize: double.infinity,
      backgroundColor: Colors.black,
      splash: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Color.fromARGB(255, 151, 137, 175),
                    Colors.deepPurple,
                    Colors.deepPurple,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          Center(
            child: Lottie.asset(
              'assets/lottie.json',
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
          ),

          // Texto decorativo opcional
          Positioned(
            bottom: 80,
            child: Column(
              children: const [
                Text(
                  'Explorando el universo...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1.2,
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text('Inicio de la App')),
    );
  }
}
