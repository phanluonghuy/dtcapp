import 'package:dtcapp/res/texts/app_text.dart';
import 'package:dtcapp/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../res/widgets/coloors.dart';
import '../../viewModel/ChiPhiDauTu_viewModel.dart';

class TinhtoanchiphiGiadien1ngayScreen extends StatefulWidget {
  const TinhtoanchiphiGiadien1ngayScreen({super.key});

  @override
  State<TinhtoanchiphiGiadien1ngayScreen> createState() =>
      _TinhtoanchiphiGiadien1ngayScreenState();
}

class _TinhtoanchiphiGiadien1ngayScreenState
    extends State<TinhtoanchiphiGiadien1ngayScreen> {
  final TextEditingController _vhtController = TextEditingController();
  final TextEditingController _vhtdController = TextEditingController();
  final TextEditingController _vhcdController = TextEditingController();

  final FocusNode _vhtFocus = FocusNode();
  final FocusNode _vhtdFocus = FocusNode();
  final FocusNode _vhcdFocus = FocusNode();

  @override
  void dispose() {
    _vhtController.dispose();
    _vhtdController.dispose();
    _vhcdController.dispose();
    _vhtFocus.dispose();
    _vhtdFocus.dispose();
    _vhcdFocus.dispose();
    super.dispose();
  }

  double _tinhChiPhi() {
    final viewModel = context.read<ChiPhiDauTuViewModel>();
    try {
      // Kiểm tra xem các trường có trống hay không
      if (_vhtController.text.isEmpty ||
          _vhtdController.text.isEmpty ||
          _vhcdController.text.isEmpty) {
        // Utils.flushBarErrorMessage("Vui lòng nhập đầy đủ thông tin cho tất cả các trường", context);
        return 0;
      }

      // Chuyển đổi các giá trị nhập vào thành số
      final vht = double.tryParse(_vhtController.text) ?? 0;
      final vhtd = double.tryParse(_vhtdController.text) ?? 0;
      final vhcd = double.tryParse(_vhcdController.text) ?? 0;

      // Kiểm tra giá trị hợp lệ
      if (vht <= 0 || vhtd <= 0 || vhcd <= 0) {
        Utils.flushBarErrorMessage(
            "Vui lòng nhập giá trị hợp lệ (số dương)", context);
        return 0;
      }

      // Kiểm tra giá trị csTrungBinh trong viewModel
      final csTrungBinh = viewModel.chiPhiDauTuModel?.csTrungBinh ?? 1;

      // Tính toán chi phí
      return (vht * 1536 + vhtd * 970 + vhcd * 2759) * csTrungBinh;
    } catch (e) {
      // Bắt các lỗi không mong muốn
      Utils.flushBarErrorMessage("Vui lòng nhập số chính xác", context);
      return 0;
    }
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
              "Tính toán chi phí giá điện 1 ngày",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: height * 0.02),
          Text('${viewModel.chiPhiDauTuModel?.ten ?? ""} - Công suất trung bình ${viewModel.chiPhiDauTuModel?.csTrungBinh ?? ""}',style: AppTextStyle.subtitle,),
          SizedBox(height: height * 0.02),
          Text('Giờ thường : 1536 đồng/giờ\nGiờ thấp điểm : 970 đồng/giờ\nGiờ cao điểm : 2759 đồng/giờ'),
          SizedBox(height: height * 0.02),
          Text("Nhập vận hành giờ thường : giờ"),
          SizedBox(height: height * 0.01),
          TextFormField(
            controller: _vhtController,
            focusNode: _vhtFocus,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (value) {
              Utils.changeNodeFocus(context,
                  current: _vhtFocus, next: _vhtdFocus);
            },
            onChanged: (value) {
              viewModel.tongChiPhi = _tinhChiPhi();
            },
            decoration: InputDecoration(
              hintText: "Nhập vận hành giờ thường",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Text("Nhập vận hành giờ thấp điểm : giờ"),
          SizedBox(height: height * 0.01),
          TextFormField(
            controller: _vhtdController,
            focusNode: _vhtdFocus,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (value) {
              Utils.changeNodeFocus(context,
                  current: _vhtdFocus, next: _vhcdFocus);
            },
            onChanged: (value) {
              viewModel.tongChiPhi = _tinhChiPhi();
            },
            decoration: InputDecoration(
              hintText: "Nhập vận hành thấp điểm",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Text("Nhập vận hành giờ cao điểm : giờ"),
          SizedBox(height: height * 0.01),
          TextFormField(
            controller: _vhcdController,
            focusNode: _vhcdFocus,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (value) {},
            onChanged: (value) {
              viewModel.tongChiPhi = _tinhChiPhi();
            },
            decoration: InputDecoration(
              hintText: "Nhập vận hành cao điểm",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
        ]),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text(
              "Tổng :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              NumberFormat.currency(locale: 'vi_VN', symbol: '₫')
                  .format(viewModel.tongChiPhi),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
