import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';

import 'core/responsive/responsive_builder.dart';

class SplashSolarTheme extends StatelessWidget {
  const SplashSolarTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, view) {
        final colorScheme = Theme.of(context).colorScheme;
        return AnimatedSplashScreen(
          splashTransition: SplashTransition.fadeTransition,
          nextScreen: const HomePage(),
          duration: 4000,
          splashIconSize: double.infinity,
          backgroundColor: Colors.black,
          splash: Stack(
            alignment: Alignment.center,
            children: [
              // Fondo con gradiente
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        colorScheme.shadow,
                        colorScheme.surfaceTint,
                        colorScheme.primaryContainer,
                        colorScheme.primary,
                        colorScheme.primary,
                      ],
                    ),
                  ),
                ),
              ),

              // Animación Lottie
              Center(
                child: Lottie.asset(
                  'assets/lottie.json',
                  width: view.isWidth,
                  height: view.scaledHeight(1.5),
                  fit: BoxFit.contain,
                ),
              ),

              // Texto inferior
              Positioned(
                bottom: view.responsive.scale(50),
                child: Text(
                  'Explorando el universo...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: view.responsive.scale(view.isFontSize),
                    fontStyle: FontStyle.italic,
                    letterSpacing: view.responsive.scale(1.4),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
