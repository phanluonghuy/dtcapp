import 'package:dtcapp/res/texts/app_text.dart';
import 'package:dtcapp/res/widgets/buttons/primaryButton.dart';
import 'package:dtcapp/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../res/widgets/coloors.dart';
import '../../viewModel/ChiPhiDauTu_viewModel.dart';

class TinhKhauHao extends StatefulWidget {
  const TinhKhauHao({super.key});

  @override
  State<TinhKhauHao> createState() => _TinhKhauHaoState();
}

class _TinhKhauHaoState extends State<TinhKhauHao> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final viewModel = context.watch<ChiPhiDauTuViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tính toán chi phí",
          style: TextStyle(color: Colors.white),
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: height * 0.02),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Tính khấu hao theo ngày",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: height * 0.02),
          Text(
            '${viewModel.chiPhiDauTuModel?.ten ?? ""} - Công suất trung bình ${viewModel.chiPhiDauTuModel?.csTrungBinh ?? ""}',
            style: AppTextStyle.subtitle,
          ),
          SizedBox(height: height * 0.02),
          Center(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minWidth: MediaQuery.of(context).size.width),
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(label: Text('Thời gian')),
                  DataColumn(label: Text('Theo ngày')),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text(viewModel.chiPhiDauTuModel?.ten ?? "")),
                      DataCell(Text(viewModel.khauHaoThietBi.toStringAsFixed(2))),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Trọm Cụm')),
                      DataCell(Text(viewModel.khauHaoTroCum.toStringAsFixed(2))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
