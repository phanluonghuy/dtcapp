import 'package:dtcapp/res/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../models/TSTK_MTM_GAO_Model.dart';
import '../../res/widgets/coloors.dart';
import '../../viewModel/TSKT_MTM_GAO_viewModel.dart';

class TSKT_MTM_GAO_Screen extends StatefulWidget {
  const TSKT_MTM_GAO_Screen({super.key});

  @override
  State<TSKT_MTM_GAO_Screen> createState() => _TSKT_MTM_GAO_ScreenState();
}

class _TSKT_MTM_GAO_ScreenState extends State<TSKT_MTM_GAO_Screen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final viewModel = context.read<TSTK_GaoViewModel>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "TSKT MTM Gạo",
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
              tabs: [
                Tab(
                    icon: Text("Máy SC",
                        style: AppTextStyle.subtitle
                            .copyWith(color: Colors.white))),
                Tab(
                    icon: Text("Máy SF",
                        style: AppTextStyle.subtitle
                            .copyWith(color: Colors.white))),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              scTabBarView(viewModel.scList, height, width),
              scTabBarView(viewModel.sfList, height, width),
            ],
          )),
    );
  }
}

Widget scTabBarView(List<TSTK_MTM_GAO> gaoList, double height, double width) {
  return SingleChildScrollView(
      child: Column(children: [
    SizedBox(height: 20),
    ListView.builder(
        shrinkWrap: true,
        itemCount: gaoList.length,
        itemBuilder: (BuildContext context, int index) {
          TSTK_MTM_GAO tstkMtmGao = gaoList[index];
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
                title: Text(tstkMtmGao.model,
                    style: AppTextStyle.subtitle.copyWith(color: Colors.black)),
                subtitle: Text(tstkMtmGao.note ?? ""),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(tstkMtmGao.model),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Text("Năng suất: "),
                                  Spacer(),
                                  Text(
                                    tstkMtmGao.capacity,
                                    style: AppTextStyle.subtitle,
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text("Số khay: "),
                                  Spacer(),
                                  Text(
                                    tstkMtmGao.trays.toString(),
                                    style: AppTextStyle.subtitle,
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text("Số đầu bắn: "),
                                  Spacer(),
                                  Text(
                                    tstkMtmGao.shootingHeads.toString(),
                                    style: AppTextStyle.subtitle,
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text("Số camera: "),
                                  Spacer(),
                                  Text(
                                    tstkMtmGao.cameras.toString(),
                                    style: AppTextStyle.subtitle,
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text("Công suất: "),
                                  Spacer(),
                                  Text(
                                    tstkMtmGao.power ?? "",
                                    style: AppTextStyle.subtitle,
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text(
                                    "Kích thước: ",
                                  ),
                                  Flexible(
                                    child: Text(
                                      tstkMtmGao.dimensions ?? "",
                                      style: AppTextStyle.subtitle,
                                      textAlign: TextAlign.end,
                                      softWrap:
                                          true, // Allows wrappingPrevents overflow
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text("Trọng lượng: "),
                                  Spacer(),
                                  Text(
                                    tstkMtmGao.weight ?? "",
                                    style: AppTextStyle.subtitle,
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text("Ghi Chú: "),
                                  Spacer(),
                                  Text(
                                    tstkMtmGao.note ?? "",
                                    style: AppTextStyle.subtitle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Đóng",
                                  style: AppTextStyle.subtitle
                                      .copyWith(color: AppColors.primaryColor)),
                            ),
                          ],
                        );
                      });
                },
              )),
            ),
          );
        })
  ]));
}
