import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/constant/app_colors.dart';
import 'package:getxdemo/constant/app_fonts.dart';
import 'package:getxdemo/home/myhomepage_controller.dart';

class MyHomePageView extends GetView<MyHomePageController> {
  const MyHomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: colorThemeBg, borderRadius: BorderRadius.circular(10)),
                child: Text(
                  '${controller.homeDataResponse.value[index].title}',
                  style: FontConstant.lufgaRegular.copyWith(color: colorTheme, fontSize: 18),
                ),
              ).marginAll(8);
            },
            itemCount: controller.homeDataResponse.value.length)),
      ),
    );
  }
}
