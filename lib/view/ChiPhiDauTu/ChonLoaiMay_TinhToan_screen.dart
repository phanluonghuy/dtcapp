import 'package:dtcapp/models/ChiPhiDauTu_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../data/ChiPhiDauTu_List.dart';
import '../../res/texts/app_text.dart';
import '../../res/widgets/coloors.dart';
import '../../viewModel/ChiPhiDauTu_viewModel.dart';

class ChiPhiDauTuChonTinhToan extends StatefulWidget {
  const ChiPhiDauTuChonTinhToan({super.key});

  @override
  State<ChiPhiDauTuChonTinhToan> createState() =>
      _ChiPhiDauTuChonTinhToanState();
}

class _ChiPhiDauTuChonTinhToanState extends State<ChiPhiDauTuChonTinhToan> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chi phí đầu tư",
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
                "Chọn phương thức tính",
                style: AppTextStyle.subtitle,
              ),
            ),
            SizedBox(height: height * 0.02),
            ListView(
              shrinkWrap: true,
              children: [
                gia(height, width, context),
                GestureDetector(
                  onTap: () {
                    context.push('/investmentDetails/tinhToanChiPhi');
                  },
                  child: tinhToanChiPhi(height, width, context),
                ),
                chiPhiVanHanh(height, width, context),
              ],
            ),
          ])),
    );
  }
}

Widget gia(height, width, context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: height * 0.1,
      decoration: BoxDecoration(
        color: Colors.white70,
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
          '1.',
          style: AppTextStyle.title,
        ),
        title: Text(
          "Giá",
          style: AppTextStyle.subtitle.copyWith(color: Colors.black),
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (String value) {
            if (value == 'view') {
              showDialog(
                  context: context,
                  builder: (context) {
                    final viewModel =
                        Provider.of<ChiPhiDauTuViewModel>(context);
                    final numberFormat =
                        NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
                    return AlertDialog(
                      title: Text('Chi phí đầu tư'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('${viewModel.chiPhiDauTuModel?.ten}'),
                              Spacer(),
                              Text(numberFormat
                                  .format(viewModel.chiPhiDauTuModel?.gia))
                            ],
                          ),
                          Row(
                            children: [
                              Text('Thiết bị phụ:'),
                              Spacer(),
                              Text(numberFormat.format(
                                  viewModel.chiPhiDauTuModel?.thietBiPhu))
                            ],
                          ),
                          Row(
                            children: [
                              Text('Hệ thống nén khí:'),
                              Spacer(),
                              Text(numberFormat.format(
                                  viewModel.chiPhiDauTuModel?.heThongNenKhi))
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Tổng:',
                                style: AppTextStyle.caption,
                              ),
                              Spacer(),
                              Text(
                                numberFormat.format(
                                  viewModel.chiPhiDauTuModel?.tongChiPhi,
                                ),
                                style: AppTextStyle.subtitle,
                              )
                            ],
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Đóng'),
                        ),
                      ],
                    );
                  });
            } else if (value == 'edit') {
              // Add your 'Edit' functionality here
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'view',
              child: Text('Xem'),
            ),
            const PopupMenuItem<String>(
              value: 'edit',
              child: Text('Chỉnh sửa'),
            ),
          ],
          icon: const Icon(Icons.more_vert),
        ),
        // onTap: () {},
      )),
    ),
  );
}

Widget tinhToanChiPhi(height, width, context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: height * 0.1,
      decoration: BoxDecoration(
        color: AppColors.primarySwatch.shade300,
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
          '2.',
          style: AppTextStyle.title,
        ),
        title: Text(
          "Tính toán chi phí",
          style: AppTextStyle.subtitle.copyWith(color: Colors.black),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      )),
    ),
  );
}

Widget chiPhiVanHanh(height, width, context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: height * 0.1,
      decoration: BoxDecoration(
        color: Colors.white70,
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
          '3.',
          style: AppTextStyle.title,
        ),
        title: Text(
          "Chi phí vận hành",
          style: AppTextStyle.subtitle.copyWith(color: Colors.black),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        // onTap: () {},
      )),
    ),
  );
}
