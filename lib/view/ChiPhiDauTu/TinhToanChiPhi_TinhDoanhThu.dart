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

class TinhDoanhThu extends StatefulWidget {
  const TinhDoanhThu({super.key});

  @override
  State<TinhDoanhThu> createState() => _TinhDoanhThuState();
}

class _TinhDoanhThuState extends State<TinhDoanhThu> {
  final TextEditingController _soGioVanHanh = TextEditingController();

  final FocusNode _soGioVanHanhFocus = FocusNode();
  final FocusNode _nguyenLieuFocus = FocusNode();
  final FocusNode _thanhPhamFocus = FocusNode();
  final FocusNode _phePhamFocus = FocusNode();

  void _tinhToanDoanhThu() {
    try {
      final viewModel = context.read<ChiPhiDauTuViewModel>();
      // Kiểm tra xem các trường có trống hay không
      if (_soGioVanHanh.text.isEmpty ||
          viewModel.giaTienNguyenLieu1Gio.text.isEmpty ||
          viewModel.giaTienThanhPhamGio.text.isEmpty ||
          viewModel.giaTienPhePham1Gio.text.isEmpty) {
        Utils.flushBarErrorMessage(
            "Vui lòng nhập đầy đủ thông tin cho tất cả các trường", context);
        return;
      }

      // Chuyển đổi các giá trị nhập vào thành số
      final sgvh = double.tryParse(_soGioVanHanh.text) ?? 0;
      final gtnl = double.tryParse(viewModel.giaTienNguyenLieu1Gio.text) ?? 0;
      final gttp = double.tryParse(viewModel.giaTienThanhPhamGio.text) ?? 0;
      final gtp = double.tryParse(viewModel.giaTienPhePham1Gio.text) ?? 0;
      if (sgvh <= 0 || gtnl <= 0 || gttp <= 0 || gtp <= 0) {
        Utils.flushBarErrorMessage(
            "Vui lòng nhập giá trị hợp lệ (số dương)", context);
      }

      viewModel.kqdoanhthu_nguyenlieu =
          viewModel.chiPhiDauTuModel!.nangSuat.nguyen * gtnl * sgvh;
      viewModel.kqdoanhthu_thanhpham =
          viewModel.chiPhiDauTuModel!.nangSuat.thanhPham * gttp * sgvh;
      viewModel.kqdoanhthu_phepham =
          viewModel.chiPhiDauTuModel!.nangSuat.phePham * gtp * sgvh;
      double _ketqua = -viewModel.kqdoanhthu_nguyenlieu +
          viewModel.kqdoanhthu_thanhpham +
          viewModel.kqdoanhthu_phepham;

      viewModel.setKqDoanhThu(_ketqua);
    } catch (e) {
      Utils.flushBarErrorMessage(
          "Vui lòng nhập giá trị hợp lệ (số dương)", context);
      return;
    }
  }

  final _currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

  @override
  void dispose() {
    _soGioVanHanh.dispose();
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
          Text("Nhập số giờ vận hành 1 ngày :"),
          SizedBox(height: height * 0.01),
          TextFormField(
            controller: _soGioVanHanh,
            focusNode: _soGioVanHanhFocus,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (value) {
              Utils.changeNodeFocus(context,
                  current: _soGioVanHanhFocus, next: _nguyenLieuFocus);
            },
            decoration: InputDecoration(
              hintText: "Nhập số giờ vận hành 1 ngày",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Text("Nhập giá tiền 1 giờ :"),
          SizedBox(height: height * 0.01),
          TextFormField(
            controller: viewModel.giaTienNguyenLieu1Gio,
            focusNode: _nguyenLieuFocus,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (value) {
              Utils.changeNodeFocus(context,
                  current: _nguyenLieuFocus, next: _thanhPhamFocus);
            },
            decoration: InputDecoration(
              hintText: "Nhập giá tiền nguyên liệu 1 giờ",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: height * 0.01),
          TextFormField(
            controller: viewModel.giaTienThanhPhamGio,
            focusNode: _thanhPhamFocus,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (value) {
              Utils.changeNodeFocus(context,
                  current: _thanhPhamFocus, next: _phePhamFocus);
            },
            decoration: InputDecoration(
              hintText: "Nhập giá tiền thành phẩm 1 giờ",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: height * 0.01),
          TextFormField(
            controller: viewModel.giaTienPhePham1Gio,
            focusNode: _phePhamFocus,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (value) {
              Utils.changeNodeFocus(context,
                  current: _phePhamFocus, next: null);
            },
            decoration: InputDecoration(
              hintText: "Nhập giá tiền phế phẩm 1 giờ",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          PrimaryButton(
            text: "Tính toán",
            onPressed: () {
              _tinhToanDoanhThu();
            },
            context: context,
          ),
          Center(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minWidth: MediaQuery.of(context).size.width),
              child: DataTable(
                columnSpacing: 16,
                columns: const <DataColumn>[
                  DataColumn(
                      label: Text('')), // Empty column for the first column
                  DataColumn(label: Text('Năng\nsuất')),
                  DataColumn(label: Text('Giá\ntiền')),
                  DataColumn(label: Text('Doanh thu 1 ngày')),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Nguyên liệu')),
                      // DataCell(Text(_currencyFormat.format(viewModel.chiPhiDauTuModel!.nangSuat.nguyen.toString()))),
                      DataCell(Text(viewModel.chiPhiDauTuModel!.nangSuat.nguyen
                          .toString())),
                      DataCell(Text(viewModel.giaTienNguyenLieu1Gio.text)),
                      DataCell(Text(
                          viewModel.kqdoanhthu_nguyenlieu.toStringAsFixed(2))),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Thành phẩm')),
                      // DataCell(Text(_currencyFormat.format(viewModel.chiPhiDauTuModel!.nangSuat.thanhPham.toString()))),
                      DataCell(Text(viewModel
                          .chiPhiDauTuModel!.nangSuat.thanhPham
                          .toString())),
                      DataCell(Text(viewModel.giaTienThanhPhamGio.text)),
                      DataCell(Text(
                          viewModel.kqdoanhthu_thanhpham.toStringAsFixed(2))),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Phế phẩm')),
                      // DataCell(Text(_currencyFormat.format(viewModel.chiPhiDauTuModel!.nangSuat.phePham.toString()))),
                      DataCell(Text(viewModel.chiPhiDauTuModel!.nangSuat.phePham
                          .toString())),
                      DataCell(Text(viewModel.giaTienPhePham1Gio.text)),
                      DataCell(Text(
                          viewModel.kqdoanhthu_phepham.toStringAsFixed(2))),
                    ],
                  ),
                ],
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
              "Doanh thu 1 ngày : ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              _currencyFormat.format(viewModel.kqdoanhthu * 1000),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
