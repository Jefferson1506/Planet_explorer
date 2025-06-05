import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/http/endpoint.dart';
import '../../../core/http/http_client.dart';
import '../../../shared/widgets/easy_loanding.dart';
import '../data/models/planet.dart';

class PlanetsServices {
  static final dio = HttpClientDio.httpClient;

  static Future<List<Planet>> getPlanets() async {
    try {
      EasyLoadingHelper.show(userInteractions: false);
      final response = await dio.get(Endpoints.planets);
      final data = response.data['data'] as List;
      return data.map(((planet) => Planet.fromJson(planet))).toList();
    } catch (e) {
      EasyLoadingHelper.showError(
        message: 'Problema con el buscado general de los planetas',
      );
    } finally {
      EasyLoadingHelper.dismiss();
    }
    return [];
  }
}

