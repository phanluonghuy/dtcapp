class ChiPhiDauTuModel {
  final String ten;
  final int gia;
  final int thietBiPhu;
  final int heThongNenKhi;
  final double csTrungBinh;
  final int tongChiPhi;
  final NangSuat nangSuat;

  ChiPhiDauTuModel({
    required this.ten,
    required this.gia,
    required this.thietBiPhu,
    required this.heThongNenKhi,
    required this.csTrungBinh,
    required this.nangSuat,
  }) : tongChiPhi = gia + thietBiPhu + heThongNenKhi;

  // Factory method to create a ProductionModel from a JSON object
  factory ChiPhiDauTuModel.fromJson(Map<String, dynamic> json) {
    return ChiPhiDauTuModel(
      ten: json['ten'],
      gia: json['gia'],
      thietBiPhu: json['thietBiPhu'],
      heThongNenKhi: json['heThongNenKhi'],
      csTrungBinh: json['csTrungBinh'],
      nangSuat: NangSuat(
        nguyen: json['nangSuat']['nguyen'],
        thanhPham: json['nangSuat']['thanhPham'],
        phePham: json['nangSuat']['phePham'],
      ),
    );
  }

  // Method to convert a ProductionModel instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'ten': ten,
      'gia': gia,
      'thietBiPhu': thietBiPhu,
      'heThongNenKhi': heThongNenKhi,
      'csTrungBinh': csTrungBinh
    };
  }
}

class NangSuat {
  final double nguyen;
  final double thanhPham;
  final double phePham;

  NangSuat({
    required this.nguyen,
    required this.thanhPham,
    required this.phePham,
  });
}
