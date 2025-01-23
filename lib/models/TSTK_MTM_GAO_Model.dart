class TSTK_MTM_GAO {
  final String model;
  final String description;
  final String capacity;
  final int? trays;
  final int? shootingHeads;
  final int? cameras;
  final String? power;
  final String? dimensions;
  final String? weight;
  final String? note;

  TSTK_MTM_GAO({
    required this.model,
    required this.description,
    required this.capacity,
    this.trays,
    this.shootingHeads,
    this.cameras,
    this.power,
    this.dimensions,
    this.weight,
    this.note,
  });

  // Factory method to load from a map
  factory TSTK_MTM_GAO.fromMap(Map<String, dynamic> map) {
    return TSTK_MTM_GAO(
      model: map['model'],
      description: map['description'],
      capacity: map['capacity'],
      trays: map['trays'],
      shootingHeads: map['shootingHeads'],
      cameras: map['cameras'],
      power: map['power'],
      dimensions: map['dimensions'],
      weight: map['weight'],
      note: map['note'],
    );
  }

  // Convert to a map (useful for serialization)
  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'description': description,
      'capacity': capacity,
      'trays': trays,
      'shootingHeads': shootingHeads,
      'cameras': cameras,
      'power': power,
      'dimensions': dimensions,
      'weight': weight,
      'note': note,
    };
  }

  bool isSCModel() {
    return model.contains("SC");
  }
}
