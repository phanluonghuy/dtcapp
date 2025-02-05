import 'package:dtcapp/view/ChiPhiDauTu/ChonLoaiMay_screen.dart';
import 'package:dtcapp/view/ThietBiPhuTro/ThietThiPhuTro_Main_Screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart'; // Import Cupertino

import '../view/ChiPhiDauTu/ChonLoaiMay_TinhToan_screen.dart';
import '../view/ChiPhiDauTu/TinhToanChiPhi_screen.dart';
import '../view/TSKT_MTM_GAO/TSKT_MTM_GAO_Main_Screen.dart';
import '../view/home_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/riceDetails",
      builder: (context, state) => const TSKT_MTM_GAO_Screen(),
    ),
    GoRoute(
      path: "/equipmentDetails",
      builder: (context, state) => const ThietBiPhuTroMainScreen(),
    ),
    GoRoute(
      path: "/investmentDetails",
      builder: (context, state) => const ChiPhiDauTuChonLoaiMay(),
      routes: [
        GoRoute(
            path: 'selectCalculator',
            builder: (context, state) => const ChiPhiDauTuChonTinhToan()),
        GoRoute(
            path: 'tinhToanChiPhi',
            builder: (context, state) => const TinhToanChiPhi()),
      ],
    ),
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(
      child: Text("No route is configured"),
    ),
  ),
);
