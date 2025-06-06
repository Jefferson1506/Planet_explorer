import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
            // Mientras está cargando
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
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

          return Scaffold(
            appBar: AppBar(
              title: Text(planet.name),
              actions: [
                IconButton(
                  icon: Icon(
                    provider.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: provider.isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: provider.toggleFavorite,
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(planet.image, height: 220, fit: BoxFit.cover),
                  const SizedBox(height: 16),
                  Text(
                    planet.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 24),
                  _buildDetail("Masa", planet.massKg),
                  _buildDetail("Distancia Orbital", planet.orbitalDistanceKm),
                  _buildDetail("Radio Ecuatorial", planet.equatorialRadiusKm),
                  _buildDetail("Volumen", planet.volumeKm3),
                  _buildDetail("Densidad", planet.densityGCm3),
                  _buildDetail("Gravedad", planet.surfaceGravityMS2),
                  _buildDetail("Velocidad Escape", planet.escapeVelocityKmh),
                  _buildDetail("Día (Tierra)", planet.dayLengthEarthDays),
                  _buildDetail("Año (Tierra)", planet.yearLengthEarthDays),
                  _buildDetail("Vel. Orbital", planet.orbitalSpeedKmh),
                  _buildDetail("Atmósfera", planet.atmosphereComposition),
                  _buildDetail("Lunas", planet.moons),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text("$title: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
