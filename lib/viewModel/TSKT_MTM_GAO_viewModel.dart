import 'package:dtcapp/data/TSTK_MTM_GAO_List.dart';
import 'package:flutter/cupertino.dart';

import '../models/TSTK_MTM_GAO_Model.dart';

class TSTK_GaoViewModel with ChangeNotifier {
  List<TSTK_MTM_GAO> _tstkGaoList = tstkMtmGaoList;

  List<TSTK_MTM_GAO> get scList =>
      _tstkGaoList.where((element) => element.isSCModel()).toList();

  List<TSTK_MTM_GAO> get sfList =>
      _tstkGaoList.where((element) => !element.isSCModel()).toList();
}
