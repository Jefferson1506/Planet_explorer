import 'package:flutter/material.dart';
import 'package:planet_explorer/src/features/planets/domain/planets_services.dart';
import '../models/planet.dart';

class PlanetProvider extends ChangeNotifier {
  List<Planet> listPlanets = [];
  TextEditingController controller = TextEditingController();

  void setFilter(String filter) {
    fetchPlanets(filter);
  }

  Future<void> fetchPlanets([String filter = '']) async {
    listPlanets = await PlanetsServices.getPlanetsFiltered(filter);
    notifyListeners();
  }

  @override
  void dispose() {
    listPlanets = [];
    controller.clear();
    super.dispose();
  }
}
