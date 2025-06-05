class Planet {
  final String name;
  final int orbitalDistanceKm;
  final int equatorialRadiusKm;
  final int volumeKm3;
  final String massKg;
  final double densityGCm3;
  final double surfaceGravityMS2;
  final int escapeVelocityKmh;
  final double dayLengthEarthDays;
  final double yearLengthEarthDays;
  final int orbitalSpeedKmh;
  final String atmosphereComposition;
  final int moons;
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
      name: json['name'],
      orbitalDistanceKm: json['orbital_distance_km'],
      equatorialRadiusKm: json['equatorial_radius_km'],
      volumeKm3: json['volume_km3'],
      massKg: json['mass_kg'],
      densityGCm3: (json['density_g_cm3'] as num).toDouble(),
      surfaceGravityMS2: (json['surface_gravity_m_s2'] as num).toDouble(),
      escapeVelocityKmh: json['escape_velocity_kmh'],
      dayLengthEarthDays: (json['day_length_earth_days'] as num).toDouble(),
      yearLengthEarthDays: (json['year_length_earth_days'] as num).toDouble(),
      orbitalSpeedKmh: json['orbital_speed_kmh'],
      atmosphereComposition: json['atmosphere_composition'],
      moons: json['moons'],
      image: json['image'],
      description: json['description'],
    );
  }
}
