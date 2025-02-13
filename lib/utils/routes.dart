import 'package:dtcapp/view/ChiPhiDauTu/ChonLoaiMay_screen.dart';
import 'package:dtcapp/view/ThietBiPhuTro/ThietThiPhuTro_Main_Screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart'; // Import Cupertino

import '../view/ChiPhiDauTu/ChonLoaiMay_TinhToan_screen.dart';
import '../view/ChiPhiDauTu/TinhToanChiPhi_screen.dart';
import '../view/TSKT_MTM_GAO/TSKT_MTM_GAO_Main_Screen.dart';
import '../view/WebViewScreen.dart';
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
    GoRoute(
      path: "/viewInstallationDrawings",
      builder: (context, state) => const WebViewScreen(
        url:
            "https://drive.google.com/drive/folders/1pg6RhijCIMzVOcy0FLRSj-RIbaKThYGk?usp=sharing",
      ),
    )
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(
      child: Text("No route is configured"),
    ),
  ),
);
