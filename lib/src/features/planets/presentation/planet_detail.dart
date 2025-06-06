import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planet_explorer/src/core/responsive/responsive_builder.dart';
import 'package:planet_explorer/src/features/planets/data/provider/planet_detail_provider.dart';

import 'package:provider/provider.dart';

class PlanetDetail extends StatelessWidget {
  final String planetName;

  const PlanetDetail({required this.planetName, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlanetDetailProvider()..fetchPlanetByName(planetName),
      child: Consumer<PlanetDetailProvider>(
        builder: (context, provider, _) {
          if (!provider.status) {
            return const Scaffold(body: Center(child: SizedBox.shrink()));
          }

          if (provider.planet == null) {
            Future.microtask(() {
              if (context.mounted) {
                context.pushReplacement('/not-found');
              }
            });
            return const Scaffold();
          }

          final planet = provider.planet!;

          return ResponsiveBuilder(
            builder: (context, view) {
              return Scaffold(
                backgroundColor: const Color.fromARGB(212, 0, 0, 0),
                appBar: AppBar(
                  backgroundColor: Colors.deepPurple.shade900,
                  elevation: 4,
                  title: Text(
                    planet.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: view.scaledFont(1.1),
                      letterSpacing: 1.2,
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(
                        provider.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:
                            provider.isFavorite
                                ? Colors.redAccent
                                : Colors.grey[300],
                      ),
                      onPressed: provider.toggleFavorite,
                      tooltip:
                          provider.isFavorite
                              ? 'Quitar favorito'
                              : 'Marcar favorito',
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Hero(
                          tag: planet.name,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              planet.image,
                              height: 240,
                              width: 240,
                              fit: BoxFit.cover,
                              loadingBuilder: (
                                context,
                                child,
                                loadingProgress,
                              ) {
                                if (loadingProgress == null) return child;
                                return SizedBox(
                                  height: view.isHeight,
                                  width: view.isWidth,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              },
                              errorBuilder:
                                  (context, error, stackTrace) => const Icon(
                                    Icons.broken_image,
                                    color: Colors.grey,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        planet.description,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: view.scaledFont(0.8),
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      ...[
                        _buildDetail(
                          context,
                          "Masa",
                          planet.massKg,
                          view.isFontSize,
                        ),
                        _buildDetail(
                          context,
                          "Distancia Orbital",
                          planet.orbitalDistanceKm,
                          view.isFontSize,
                        ),
                        _buildDetail(
                          context,
                          "Radio Ecuatorial",
                          planet.equatorialRadiusKm,
                          view.isFontSize,
                        ),
                        _buildDetail(
                          context,
                          "Volumen",
                          planet.volumeKm3,
                          view.isFontSize,
                        ),
                        _buildDetail(
                          context,
                          "Densidad",
                          planet.densityGCm3,
                          view.isFontSize,
                        ),
                        _buildDetail(
                          context,
                          "Gravedad",
                          planet.surfaceGravityMS2,
                          view.isFontSize,
                        ),
                        _buildDetail(
                          context,
                          "Velocidad Escape",
                          planet.escapeVelocityKmh,
                          view.isFontSize,
                        ),
                        _buildDetail(
                          context,
                          "Día (Tierra)",
                          planet.dayLengthEarthDays,
                          view.isFontSize,
                        ),
                        _buildDetail(
                          context,
                          "Año (Tierra)",
                          planet.yearLengthEarthDays,
                          view.isFontSize,
                        ),
                        _buildDetail(
                          context,
                          "Vel. Orbital",
                          planet.orbitalSpeedKmh,
                          view.isFontSize,
                        ),
                        _buildDetail(
                          context,
                          "Atmósfera",
                          planet.atmosphereComposition,
                          view.isFontSize,
                        ),
                        _buildDetail(
                          context,
                          "Lunas",
                          planet.moons,
                          view.isFontSize,
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildDetail(
    BuildContext context,
    String title,
    String value,
    double size,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple.shade200,
              fontSize: size,
              letterSpacing: 0.3,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: size,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
