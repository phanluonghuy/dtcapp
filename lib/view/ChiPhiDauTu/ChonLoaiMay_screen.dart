import 'package:dtcapp/models/ChiPhiDauTu_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../data/ChiPhiDauTu_List.dart';
import '../../res/texts/app_text.dart';
import '../../res/widgets/coloors.dart';
import '../../viewModel/ChiPhiDauTu_viewModel.dart';

class ChiPhiDauTuChonLoaiMay extends StatefulWidget {
  const ChiPhiDauTuChonLoaiMay({super.key});

  @override
  State<ChiPhiDauTuChonLoaiMay> createState() => _ChiPhiDauTuChonLoaiMayState();
}

class _ChiPhiDauTuChonLoaiMayState extends State<ChiPhiDauTuChonLoaiMay> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chọn loại máy",
          style: AppTextStyle.title.copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: [
            SizedBox(height: height * 0.02),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Chọn loại máy",
                style: AppTextStyle.subtitle,
              ),
            ),
            SizedBox(height: height * 0.02),
            ListView.builder(
                shrinkWrap: true,
                itemCount: danhSachMayChiPhiDauTu.length,
                itemBuilder: (BuildContext context, int index) {
                  ChiPhiDauTuModel entry = danhSachMayChiPhiDauTu[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? Colors.white70
                            : AppColors.primarySwatch.shade300,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                          child: ListTile(
                        leading: Text(
                          '${(index + 1).toString()}.',
                          style: AppTextStyle.title,
                        ),
                        title: Text(entry.ten,
                            style: AppTextStyle.subtitle
                                .copyWith(color: Colors.black)),
                        onTap: () {
                          context
                              .read<ChiPhiDauTuViewModel>()
                              .chiPhiDauTuModel = entry;
                          context
                              .read<ChiPhiDauTuViewModel>()
                              .index = index;
                          context.push('/investmentDetails/selectCalculator');
                        },
                      )),
                    ),
                  );
                }),
          ])),
    );
  }
}
