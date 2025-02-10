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

class TinhLoiNhau1Ngay extends StatefulWidget {
  const TinhLoiNhau1Ngay({super.key});

  @override
  State<TinhLoiNhau1Ngay> createState() => _TinhLoiNhau1NgayState();
}

class _TinhLoiNhau1NgayState extends State<TinhLoiNhau1Ngay> {
  final TextEditingController _giaGiaCong =
      TextEditingController(text: "150000");
  final TextEditingController _soGioVanHanh = TextEditingController();
  final TextEditingController _luongNhanVien =
      TextEditingController(text: "500000");

  final FocusNode _giaGiaCongFocus = FocusNode();
  final FocusNode _soGioVanHanhFocus = FocusNode();
  final FocusNode _luongNhanVienFocus = FocusNode();

  String _details = "";

  @override
  void dispose() {
    super.dispose();
  }

  double _tinhChiPhi() {
    final viewModel = context.read<ChiPhiDauTuViewModel>();
    if (viewModel.tongChiPhi == 0) {
      Utils.flushBarErrorMessage("Vui lòng tính giá điện trước", context);
      return 0;
    }
    try {
      // Kiểm tra xem các trường có trống hay không
      if (_giaGiaCong.text.isEmpty ||
          _soGioVanHanh.text.isEmpty ||
          _luongNhanVien.text.isEmpty) {
        Utils.flushBarErrorMessage(
            "Vui lòng nhập đầy đủ thông tin cho tất cả các trường", context);
        return 0;
      }

      // Chuyển đổi các giá trị nhập vào thành số
      final ggc = double.tryParse(_giaGiaCong.text) ?? 0;
      final sgvh = double.tryParse(_soGioVanHanh.text) ?? 0;
      final lnv = double.tryParse(_luongNhanVien.text) ?? 0;

      // Kiểm tra giá trị hợp lệ
      if (ggc <= 0 || sgvh <= 0 || lnv <= 0) {
        Utils.flushBarErrorMessage(
            "Vui lòng nhập giá trị hợp lệ (số dương)", context);
        return 0;
      }

      // Tính toán chi phí
      // return (vht * 1536 + vhtd * 970 + vhcd * 2759) * csTrungBinh;
      _details = "(${ggc} * ${sgvh}) - (${viewModel.tongChiPhi} + ${lnv})";
      return (16 * ggc * sgvh) - (viewModel.tongChiPhi + lnv);
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
              "Tính lợi nhuận 1 ngày",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Giá điện 1 ngày :  ${NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(viewModel.tongChiPhi)}',
            style: AppTextStyle.subtitle,
          ),
          SizedBox(height: height * 0.02),
          Text("Nhập giá gia công 1 giờ :"),
          SizedBox(height: height * 0.01),
          TextFormField(
            controller: _giaGiaCong,
            focusNode: _giaGiaCongFocus,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (value) {
              Utils.changeNodeFocus(context,
                  current: _giaGiaCongFocus, next: _soGioVanHanhFocus);
            },
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: "Nhập giá gia công 1 giờ",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Text("Nhập vận hành giờ thấp điểm : giờ"),
          SizedBox(height: height * 0.01),
          TextFormField(
            controller: _soGioVanHanh,
            focusNode: _soGioVanHanhFocus,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (value) {
              Utils.changeNodeFocus(context,
                  current: _soGioVanHanhFocus, next: _luongNhanVienFocus);
            },
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: "Nhập số giờ vận hành 1 ngày",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Text("Nhập lương nhân viên 1 ngày :"),
          SizedBox(height: height * 0.01),
          TextFormField(
            controller: _luongNhanVien,
            focusNode: _luongNhanVienFocus,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (value) {
              Utils.changeNodeFocus(context,
                  current: _luongNhanVienFocus, next: null);
            },
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: "Nhập lương nhân viên 1 ngày",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          PrimaryButton(
              text: "Tính",
              onPressed: () {
                viewModel.loiNhuan = _tinhChiPhi();
                if (viewModel.loiNhuan != 0) {
                  Utils.flushBarSuccessMessage(_details, context);
                }
              },
              context: context)
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
                  .format(viewModel.loiNhuan),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
