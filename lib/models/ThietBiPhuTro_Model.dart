class PhuTroModel {
  final String model;
  final String image;

  PhuTroModel({required this.model, required this.image});

  // Factory constructor for JSON conversion
  factory PhuTroModel.fromMap(Map<String, dynamic> map) {
    return PhuTroModel(
      model: map['model'] as String,
      image: map['image'] as String,
    );
  }

  @override
  String toString() {
    return 'PhuTroModel{model: $model, image: $image}';
  }
}

class PhuTroCategory {
  final String categoryName;
  final List<PhuTroModel> items;

  PhuTroCategory({required this.categoryName, required this.items});

  // Factory constructor for JSON conversion
  factory PhuTroCategory.fromMap(String key, List<Map<String, dynamic>> value) {
    return PhuTroCategory(
      categoryName: key,
      items: value.map((item) => PhuTroModel.fromMap(item)).toList(),
    );
  }

  @override
  String toString() {
    return 'PhuTroCategory{categoryName: $categoryName, items: $items}';
  }
}
