import 'package:flutter/material.dart';
import 'package:planet_explorer/src/features/planets/data/models/planet.dart';
import 'package:planet_explorer/src/features/planets/domain/planets_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlanetDetailProvider extends ChangeNotifier {
  Planet? _planet;
  bool _isFavorite = false;
  bool status = false; // para indicar que terminó de cargar (fetch)

  Planet? get planet => _planet;
  bool get isFavorite => _isFavorite;

  Future<void> fetchPlanetByName(String name) async {
    final planets = await PlanetsServices.getPlanetsFiltered(name);
    try {
      _planet = planets.firstWhere(
        (p) => p.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (e) {
      _planet = null;
    }

    if (_planet != null) {
      await _loadFavoriteStatus();
    }

    status = true; // indica que ya terminó de intentar cargar
    notifyListeners();
  }

  Future<void> _loadFavoriteStatus() async {
    if (_planet == null) return;
    final prefs = await SharedPreferences.getInstance();
    final nameKey = _planet!.name.toLowerCase();
    _isFavorite = prefs.getBool(nameKey) ?? false;
  }

  Future<void> toggleFavorite() async {
    if (_planet == null) return;
    final prefs = await SharedPreferences.getInstance();
    final nameKey = _planet!.name.toLowerCase();
    _isFavorite = !_isFavorite;
    await prefs.setBool(nameKey, _isFavorite);
    notifyListeners();
  }
}
