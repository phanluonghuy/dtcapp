import 'package:dtcapp/res/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

import '../../models/ThietBiPhuTro_Model.dart';
import '../../res/widgets/coloors.dart';
import '../../viewModel/ThietBiPhuTro_viewModel.dart';

class ThietBiPhuTroMainScreen extends StatefulWidget {
  const ThietBiPhuTroMainScreen({super.key});

  @override
  State<ThietBiPhuTroMainScreen> createState() =>
      _ThietBiPhuTroMainScreenState();
}

class _ThietBiPhuTroMainScreenState extends State<ThietBiPhuTroMainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // context.read<ThietBiPhuTroViewModel>().setTabController(_tabController);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ThietBiPhuTroViewModel>().setTabController(_tabController);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final viewModel = context.read<ThietBiPhuTroViewModel>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Thiết bị phụ trợ",
            style: AppTextStyle.title.copyWith(color: Colors.white),
          ),
          backgroundColor: AppColors.primaryColor,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              context.pop();
            },
          ),
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                  icon: Text("Thiết bị",
                      style:
                          AppTextStyle.subtitle.copyWith(color: Colors.white))),
              Tab(
                  icon: Text("Danh Sách",
                      style:
                          AppTextStyle.subtitle.copyWith(color: Colors.white))),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _thietBi(height, width, viewModel),
            _dsThietBi(height, width, viewModel),
          ],
        ),
      ),
    );
  }
}

Widget _thietBi(height, width, ThietBiPhuTroViewModel viewModel) {
  return SingleChildScrollView(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      children: [
        SizedBox(height: height * 0.02),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Chọn thiết bị phụ trợ",
            style: AppTextStyle.subtitle,
          ),
        ),
        SizedBox(height: height * 0.02),
        ListView.builder(
            shrinkWrap: true,
            itemCount: viewModel.dsThietBi.length,
            itemBuilder: (BuildContext context, int index) {
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
                    title: Text(viewModel.dsThietBi[index] ?? "",
                        style: AppTextStyle.body.copyWith(color: Colors.black)),
                    onTap: () {
                      viewModel.tenThietBi = viewModel.dsThietBi[index];
                      viewModel.switchToTab(1);
                    },
                  )),
                ),
              );
            })
      ],
    ),
  );
}

Widget _dsThietBi(height, width, ThietBiPhuTroViewModel viewModel) {
  return SingleChildScrollView(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      children: [
        SizedBox(height: height * 0.02),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Chọn máy",
            style: AppTextStyle.subtitle,
          ),
        ),
        SizedBox(height: height * 0.02),
        ValueListenableBuilder(
            valueListenable: viewModel.length,
            builder: (context, value, child) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: value,
                  itemBuilder: (BuildContext context, int index) {
                    PhuTroModel model = viewModel.getItems()[index];
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
                          title: Text(model.model ?? "",
                              style: AppTextStyle.body
                                  .copyWith(color: Colors.black)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PhotoView(
                                  imageProvider: AssetImage(model.image),
                                  enableRotation: true,
                                  minScale: PhotoViewComputedScale.contained,
                                ), // Replace with your image
                              ),
                            );
                          },
                        )),
                      ),
                    );
                  });
            }),
      ],
    ),
  );
}
