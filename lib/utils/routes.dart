import 'package:dtcapp/view/ThietBiPhuTro/ThietThiPhuTro_Main_Screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';  // Import Cupertino

import '../view/TSKT_MTM_GAO/TSKT_MTM_GAO_Main_Screen.dart';
import '../view/home_screen.dart';

// Define the custom linear transition
CupertinoPageTransition linearTransition(
    Animation<double> primaryRouteAnimation,
    Animation<double> secondaryRouteAnimation,
    Widget child,
    ) {
  return CupertinoPageTransition(
    primaryRouteAnimation: primaryRouteAnimation,
    secondaryRouteAnimation: secondaryRouteAnimation,
    linearTransition: false, // Apply linear transition
    child: child,
  );
}

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return linearTransition(animation, secondaryAnimation, child); // Apply linearTransition
          },
        );
      },
    ),
    GoRoute(
      path: "/riceDetails",
      builder: (context, state) => const TSKT_MTM_GAO_Screen(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const TSKT_MTM_GAO_Screen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return linearTransition(animation, secondaryAnimation, child); // Apply linearTransition
          },
        );
      },
    ),
    GoRoute(
      path: "/equipmentDetails",
      builder: (context, state) => const ThietBiPhuTroMainScreen(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const ThietBiPhuTroMainScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return linearTransition(animation, secondaryAnimation, child); // Apply linearTransition
          },
        );
      },
    ),
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(
      child: Text("No route is configured"),
    ),
  ),
);
