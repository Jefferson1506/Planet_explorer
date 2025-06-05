class Planet {
  final String name;
  final String orbitalDistanceKm;
  final String equatorialRadiusKm;
  final String volumeKm3;
  final String massKg;
  final String densityGCm3;
  final String surfaceGravityMS2;
  final String escapeVelocityKmh;
  final String dayLengthEarthDays;
  final String yearLengthEarthDays;
  final String orbitalSpeedKmh;
  final String atmosphereComposition;
  final String moons;
  final String image;
  final String description;

  Planet({
    required this.name,
    required this.orbitalDistanceKm,
    required this.equatorialRadiusKm,
    required this.volumeKm3,
    required this.massKg,
    required this.densityGCm3,
    required this.surfaceGravityMS2,
    required this.escapeVelocityKmh,
    required this.dayLengthEarthDays,
    required this.yearLengthEarthDays,
    required this.orbitalSpeedKmh,
    required this.atmosphereComposition,
    required this.moons,
    required this.image,
    required this.description,
  });

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      name: json['name'].toString(),
      orbitalDistanceKm: json['orbital_distance_km'].toString(),
      equatorialRadiusKm: json['equatorial_radius_km'].toString(),
      volumeKm3: json['volume_km3'].toString(),
      massKg: json['mass_kg'].toString(),
      densityGCm3: json['density_g_cm3'].toString(),
      surfaceGravityMS2: json['surface_gravity_m_s2'].toString(),
      escapeVelocityKmh: json['escape_velocity_kmh'].toString(),
      dayLengthEarthDays: json['day_length_earth_days'].toString(),
      yearLengthEarthDays: json['year_length_earth_days'].toString(),
      orbitalSpeedKmh: json['orbital_speed_kmh'].toString(),
      atmosphereComposition: json['atmosphere_composition'].toString(),
      moons: json['moons'].toString(),
      image: json['image'].toString(),
      description: json['description'].toString(),
    );
  }
}
