import 'package:dtcapp/utils/listApp.dart';
import 'package:flutter/material.dart';

import '../models/ThietBiPhuTro_Model.dart';

class ThietBiPhuTroViewModel with ChangeNotifier {
  String _tenThietBi = "TBP LẮP 1 MÁY";
  final List<String> _dsThietBi = phutroList.keys.toList();
  ValueNotifier<int> _length = ValueNotifier<int>(0);
  List<PhuTroModel> _items = [];

  set tenThietBi(String value) {
    _tenThietBi = value;
    _items =
        phutroList[_tenThietBi]?.map((e) => PhuTroModel.fromMap(e)).toList() ??
            [];
    _length.value = _items.length;
    notifyListeners();
    notifyListeners();
  }

  TabController? _tabController;

  List<String> get dsThietBi => _dsThietBi;

  TabController? get tabController => _tabController;

  String get tenThietBi {
    return _tenThietBi;
  }

  ValueNotifier<int> get length => _length;

  void setTabController(TabController controller) {
    _tabController = controller;
    notifyListeners();
  }

  void switchToTab(int index) {
    if (_tabController != null && _tabController!.index != index) {
      _tabController!.animateTo(index);
    }
  }

  List<PhuTroModel> getItems() {
    return _items;
  }
}
