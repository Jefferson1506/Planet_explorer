import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planet_explorer/src/core/responsive/responsive_builder.dart';
import 'package:planet_explorer/src/features/planets/data/provider/planet_provider.dart';
import 'package:planet_explorer/src/shared/widgets/animate.dart';
import 'package:planet_explorer/src/shared/widgets/input.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PlanetsLists extends StatelessWidget {
  const PlanetsLists({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlanetProvider()..fetchPlanets(''),
      child: ResponsiveBuilder(
        builder: (context, view) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            body: Consumer<PlanetProvider>(
              builder: (context, provider, _) {
                final planets = provider.listPlanets;

                return Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    ...List.generate(80, (index) {
                      final random = Random();
                      final dx =
                          random.nextDouble() *
                          MediaQuery.of(context).size.width;
                      final dy =
                          random.nextDouble() *
                          MediaQuery.of(context).size.height;
                      final size = random.nextDouble() * 4 + 1;

                      return Positioned(
                        left: dx,
                        top: dy,
                        child: Container(
                          width: size,
                          height: size,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(171, 60, 59, 59),
                            shape: BoxShape.circle,
                          ),
                        ),
                      );
                    }),

                    Positioned(
                      top: view.scaledHeight(0.6),
                      child: SizedBox(
                        width: view.scaledWidth(1.3),
                        height: view.scaledHeight(0.14),
                        child: CustomTextFormFilter(
                          controller: provider.controller,
                          hintText: 'Buscar ...',
                          onChanged: (value) => provider.setFilter(value),
                          onClearTap:
                              () => {
                                provider.controller.clear(),
                                provider.setFilter(''),
                              },
                        ),
                      ),
                    ),

                    if (planets.isNotEmpty)
                      Center(
                        child: CarouselSlider.builder(
                          itemCount: planets.length,
                          options: CarouselOptions(
                            height: view.scaledHeight(1.3),
                            viewportFraction: 0.7,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            enableInfiniteScroll: true,
                            padEnds: false,
                          ),
                          itemBuilder: (context, index, realIndex) {
                            final planet = planets[index];
                            final imagePath =
                                imgPlanets[planet.name.toLowerCase()] ?? '';

                            return GestureDetector(
                              onTap: () {
                                context.push('/planets/${planet.name}');
                              },
                              child: AnimateWrapper.zoomIn(
                                child: Card(
                                  color: Colors.grey[900]?.withAlpha(170),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  elevation: 12,
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      view.scaledFont(3.2),
                                    ),
                                    child: Column(
                                      spacing: 10,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          imagePath,
                                          width: 140,
                                          height: 140,
                                          fit: BoxFit.contain,
                                        ),
                                        Text(
                                          planet.name,
                                          style: TextStyle(
                                            fontSize: view.scaledFont(1.5),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

const imgPlanets = {
  'mercury': 'assets/img/mercury.png',
  'venus': 'assets/img/venus.png',
  'earth': 'assets/img/earth.png',
  'mars': 'assets/img/mars.png',
  'jupiter': 'assets/img/jupiter.png',
  'saturn': 'assets/img/saturn.png',
  'uranus': 'assets/img/uranus.png',
  'neptune': 'assets/img/neptune.png',
};
