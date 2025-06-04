import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';

import '../../../core/responsive/responsive_builder.dart';
import '../../../shared/widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final colorScheme = Theme.of(context).colorScheme;
    final listShadow = _shadow(colorScheme);

    return SafeArea(
      child: ResponsiveBuilder(
        builder: (context, view) {
          return Scaffold(
            body: Stack(
              children: [
                Container(color: colorScheme.primary),
                ...List.generate(100, (index) {
                  final dx =
                      random.nextDouble() * MediaQuery.of(context).size.width;
                  final dy =
                      random.nextDouble() * MediaQuery.of(context).size.height;
                  final size = random.nextDouble() * 2 + 1;

                  return Positioned(
                    left: dx,
                    top: dy,
                    child: Container(
                      width: size,
                      height: size,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                }),
                Center(
                  child: Container(
                    width: view.isWidth,
                    height: view.isHeight,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        center: const Alignment(-0.3, -0.3),
                        radius: 0.9,
                        colors: [
                          _planetColor(colorScheme).withAlpha(230),
                          _planetColor(colorScheme).withAlpha(170),
                          _planetColor(colorScheme).withAlpha(125),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.shadow.withAlpha(77),
                          blurRadius: view.scaledFont(3),
                          spreadRadius: view.scaledFont(0.05),
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: view.scaledHeight(0.18),
                          left: view.scaledWidth(0.2),
                          child: _crater(view.scaledFont(1.2), listShadow),
                        ),
                        Positioned(
                          top: view.scaledHeight(0.17),
                          left: view.scaledWidth(0.4),
                          child: _crater(view.scaledFont(0.6), listShadow),
                        ),
                        Positioned(
                          top: view.scaledHeight(0.3),
                          left: view.scaledWidth(0.51),
                          child: _crater(view.scaledFont(0.4), listShadow),
                        ),
                        Positioned(
                          top: view.scaledHeight(0.32),
                          left: view.scaledWidth(0.12),
                          child: _crater(view.scaledFont(0.7), listShadow),
                        ),

                        Positioned(
                          top: view.scaledHeight(0.4),
                          left: view.scaledWidth(0.2),
                          child: Lottie.asset(
                            'assets/lottie/lottie_home.json',
                            width: view.isWidth,
                            height: view.scaledHeight(0.6),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Center(
                  child: CustomButton.gold(
                    label: 'Ver Planetas',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Color _planetColor(ColorScheme scheme) {
    return scheme.brightness == Brightness.dark
        ? scheme.primaryFixedDim
        : scheme.onPrimaryContainer;
  }

  List<Color> _shadow(ColorScheme scheme) {
    return scheme.brightness == Brightness.dark
        ? [
          const Color.fromARGB(255, 34, 34, 34).withAlpha(100),
          const Color.fromARGB(255, 255, 255, 255).withAlpha(70),
        ]
        : [
          const Color.fromARGB(255, 255, 255, 255).withAlpha(100),
          const Color.fromARGB(255, 39, 39, 39).withAlpha(80),
        ];
  }

  Widget _crater(double radius, List<Color> shadowList) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        color: shadowList[0],
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: shadowList[1],
            blurRadius: 4,
            offset: const Offset(1, 1),
          ),
        ],
      ),
    );
  }
}
