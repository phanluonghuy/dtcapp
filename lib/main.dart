import 'package:dtcapp/res/widgets/coloors.dart';
import 'package:dtcapp/utils/routes.dart';
import 'package:dtcapp/viewModel/TSKT_MTM_GAO_viewModel.dart';
import 'package:dtcapp/viewModel/ThietBiPhuTro_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TSTK_GaoViewModel(), lazy: true),
        ChangeNotifierProvider(
            create: (_) => ThietBiPhuTroViewModel(), lazy: true),
      ],
      child: WillPopScope(
          child: MaterialApp.router(
            title: 'DTC Group',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: AppColors.primaryColor,
              textTheme: GoogleFonts.interTextTheme(),
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                },
              ),
            ),

            routerConfig: router, // Use the GoRouter instance
          ),
          onWillPop: () async {
            Navigator.pop(context);
            return true;
          }),
    );
  }
}
