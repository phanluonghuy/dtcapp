import 'package:dtcapp/data/ChiPhiDauTu_List.dart';
import 'package:dtcapp/models/ChiPhiDauTu_Model.dart';
import 'package:flutter/cupertino.dart';

class ChiPhiDauTuViewModel with ChangeNotifier {
  ChiPhiDauTuModel? _chiPhiDauTuModel;

  ChiPhiDauTuModel? get chiPhiDauTuModel => _chiPhiDauTuModel;

  int _index = 0;

  double _tongChiPhi = 0;

  double _loiNhuan = 0;

  double get loiNhuan => _loiNhuan;

  double get tongChiPhi => _tongChiPhi;

  double _khauHaoThietBi = 0;
  double _khauHaoTroCum = 0;

  double get khauHaoThietBi => _khauHaoThietBi;
  double get khauHaoTroCum => _khauHaoTroCum;

  double _kqdoanhthu_nguyenlieu = 0;
  double _kqdoanhthu_thanhpham = 0;
  double _kqdoanhthu_phepham = 0;

  double _kqdoanhthu = 0;

  double get kqdoanhthu_nguyenlieu => _kqdoanhthu_nguyenlieu;
  double get kqdoanhthu_thanhpham => _kqdoanhthu_thanhpham;
  double get kqdoanhthu_phepham => _kqdoanhthu_phepham;
  double get kqdoanhthu => _kqdoanhthu;

  final TextEditingController _giaTienNguyenLieu1Gio = TextEditingController();
  final TextEditingController _giaTienThanhPhamGio = TextEditingController();
  final TextEditingController _giaTienPhePham1Gio = TextEditingController();

  TextEditingController get giaTienNguyenLieu1Gio => _giaTienNguyenLieu1Gio;
  TextEditingController get giaTienThanhPhamGio => _giaTienThanhPhamGio;
  TextEditingController get giaTienPhePham1Gio => _giaTienPhePham1Gio;

  void setKqDoanhThu(double ketqua) {
    // _kqdoanhthu_nguyenlieu = 16.0 * 9300 * numOfDay;
    // _kqdoanhthu_thanhpham = 15.5 * 9300 * numOfDay;
    // _kqdoanhthu_phepham = 0.5 * 9300 * numOfDay;
    _kqdoanhthu = ketqua;
    notifyListeners();
  }


  set kqdoanhthu_nguyenlieu(double value) {
    _kqdoanhthu_nguyenlieu = value;
  }

  set tongChiPhi(double value) {
    _tongChiPhi = value;
    notifyListeners();
  }

  set loiNhuan(double value) {
    _loiNhuan = value;

    _khauHaoThietBi = (_chiPhiDauTuModel?.gia ?? 1) / _loiNhuan;
    _khauHaoTroCum = (_chiPhiDauTuModel?.tongChiPhi ?? 1) / _loiNhuan;

    notifyListeners();
  }

  int get index => _index;

  set index(int value) {
    _index = value;
  }

  set chiPhiDauTuModel(ChiPhiDauTuModel? value) {
    _chiPhiDauTuModel = value;
    notifyListeners();
  }

  set kqdoanhthu_thanhpham(double value) {
    _kqdoanhthu_thanhpham = value;
  }

  set kqdoanhthu_phepham(double value) {
    _kqdoanhthu_phepham = value;
  }
}
