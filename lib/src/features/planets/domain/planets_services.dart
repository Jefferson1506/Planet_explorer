import '../../../core/http/endpoint.dart';
import '../../../core/http/http_client.dart';
import '../../../shared/widgets/easy_loanding.dart';
import '../data/models/planet.dart';

class PlanetsServices {
  static final dio = HttpClientDio.httpClient;

  static Future<List<Planet>> getPlanetsFiltered(String filter) async {
    try {
      EasyLoadingHelper.show(userInteractions: false);

      final response = await dio.get(Endpoints.planets);

      final data = response.data['data'] as List;
      final planets = data.map((planet) => Planet.fromJson(planet)).toList();

      if (filter.isNotEmpty) {
        return planets
            .where(
              (planet) =>
                  planet.name.toLowerCase().contains(filter.toLowerCase()),
            )
            .toList();
      }

      return planets;
    } catch (e) {
      EasyLoadingHelper.showError(
        message: 'Problema con el buscado de los planetas',
      );
    } finally {
      EasyLoadingHelper.dismiss();
    }
    return [];
  }
}
