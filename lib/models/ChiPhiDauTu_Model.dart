class ChiPhiDauTuModel {
  final String ten;
  final int gia;
  final int thietBiPhu;
  final int heThongNenKhi;
  final double csTrungBinh;
  final int tongChiPhi;

  ChiPhiDauTuModel({
    required this.ten,
    required this.gia,
    required this.thietBiPhu,
    required this.heThongNenKhi,
    required this.csTrungBinh,
  }) : tongChiPhi = gia + thietBiPhu + heThongNenKhi;

  // Factory method to create a ProductionModel from a JSON object
  factory ChiPhiDauTuModel.fromJson(Map<String, dynamic> json) {
    return ChiPhiDauTuModel(
      ten: json['ten'],
      gia: json['gia'],
      thietBiPhu: json['thietBiPhu'],
      heThongNenKhi: json['heThongNenKhi'],
      csTrungBinh: json['csTrungBinh'],
    );
  }

  // Method to convert a ProductionModel instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'ten': ten,
      'gia': gia,
      'thietBiPhu': thietBiPhu,
      'heThongNenKhi': heThongNenKhi,
      'csTrungBinh' : csTrungBinh
    };
  }
}
