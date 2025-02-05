import 'package:dtcapp/data/CPDT_cstieuthu1h.dart';
import 'package:dtcapp/models/ChiPhiDauTu_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../data/ChiPhiDauTu_List.dart';
import '../../res/texts/app_text.dart';
import '../../res/widgets/PowerConsumptionTable.dart';
import '../../res/widgets/coloors.dart';
import '../../viewModel/ChiPhiDauTu_viewModel.dart';
import 'TinhToanChiPhi_GiaDien1Ngay_screen.dart';

class TinhToanChiPhi extends StatefulWidget {
  const TinhToanChiPhi({super.key});

  @override
  State<TinhToanChiPhi> createState() => _TinhToanChiPhiState();
}

class _TinhToanChiPhiState extends State<TinhToanChiPhi> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final viewModel = context.read<ChiPhiDauTuViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tính toán chi phí",
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
            ListView(
              shrinkWrap: true,
              children: [
                element(context, height, 0, "Công suất tiêu thụ 1 giờ", () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => PowerConsumptionTable(
                              data: CPDT_cstieuthu1h[viewModel.index],
                            )),
                  );
                }),
                element(context, height, 1, "Tính giá điện 1 ngày", () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TinhtoanchiphiGiadien1ngayScreen()));
                }),
                element(context, height, 2, "Tính lợi nhậu 1 ngày", () {}),
                element(context, height, 3, "Tính khấu hao", () {}),
                element(context, height, 4, "Tính doanh thu", () {}),
              ],
            )
          ])),
    );
  }
}

Widget element(BuildContext context, height, int index, String functionName,
    VoidCallback onPressed) {
  {
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
            '2.${(index + 1).toString()}.',
            style: AppTextStyle.title,
          ),
          title: Text(functionName,
              style: AppTextStyle.subtitle.copyWith(color: Colors.black)),
          onTap: onPressed,
        )),
      ),
    );
  }
}
