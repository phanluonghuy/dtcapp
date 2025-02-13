import 'package:dtcapp/res/texts/app_text.dart';
import 'package:dtcapp/res/widgets/buttons/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../res/widgets/coloors.dart';
import '../utils/listApp.dart';
import 'WebViewScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   "DTC Group",
        //   style: AppTextStyle.title.copyWith(color: Colors.white),
        // ),
        // title: Container(
        //     padding:
        //         const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(12),
        //       color: Colors.white70,
        //     ),
        //     child: Image.asset('assets/icons/logo-long.png', height: 20)),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white70,
          ),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'DTC',
                  style: AppTextStyle.title.copyWith(color: Color(0xFF00732F)),
                ),
                TextSpan(
                  text: 'Group',
                  style: AppTextStyle.title.copyWith(color: Color(0xFF6BC048)),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 10,
                  mainAxisExtent: height * 0.1,
                ),
                itemCount: appFunctions.length,
                itemBuilder: (BuildContext context, int index) {
                  final entry = appFunctions.entries.elementAt(index);
                  return Container(
                    height: height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                        child: ListTile(
                      title: Text(entry.key,
                          style: AppTextStyle.subtitle
                              .copyWith(color: Colors.black)),
                      leading: SvgPicture.asset(
                        entry.value['icon'],
                        width: 50,
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      minLeadingWidth: 60,
                      onTap: () => context.push(entry.value['path']),
                    )),
                  );
                }),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
