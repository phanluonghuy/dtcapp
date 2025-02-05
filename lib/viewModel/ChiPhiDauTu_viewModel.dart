import 'package:dtcapp/data/ChiPhiDauTu_List.dart';
import 'package:dtcapp/models/ChiPhiDauTu_Model.dart';
import 'package:flutter/cupertino.dart';

class ChiPhiDauTuViewModel with ChangeNotifier {
  ChiPhiDauTuModel? _chiPhiDauTuModel;

  ChiPhiDauTuModel? get chiPhiDauTuModel => _chiPhiDauTuModel;

  int _index = 0;

  double _tongChiPhi = 0;


  double get tongChiPhi => _tongChiPhi;

  set tongChiPhi(double value) {
    _tongChiPhi = value;
  }

  int get index => _index;

  set index(int value) {
    _index = value;
  }

  set chiPhiDauTuModel(ChiPhiDauTuModel? value) {
    _chiPhiDauTuModel = value;
    notifyListeners();
  }
}
