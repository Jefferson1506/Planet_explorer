import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import 'core/responsive/responsive_builder.dart';

class SplashSolarTheme extends StatefulWidget {
  const SplashSolarTheme({super.key});

  @override
  State<SplashSolarTheme> createState() => _SplashSolarThemeState();
}

class _SplashSolarThemeState extends State<SplashSolarTheme>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _nextPage();
  }

  void _nextPage() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        context.go('/home');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ResponsiveBuilder(
      builder: (context, view) {
        return FadeTransition(
          opacity: _animation,
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
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
                    'assets/lottie/lottie.json',
                    width: view.isWidth,
                    height: view.scaledHeight(1.5),
                    fit: BoxFit.contain,
                  ),
                ),

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
          ),
        );
      },
    );
  }
}
