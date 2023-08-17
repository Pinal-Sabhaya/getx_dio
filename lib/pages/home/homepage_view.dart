import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/constant/app_colors.dart';
import 'package:getxdemo/constant/app_fonts.dart';
import 'package:getxdemo/pages/home/homepage_controller.dart';

class MyHomePageView extends GetView<MyHomePageController> {
  const MyHomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => ListView.builder(
          shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: colorThemeBg, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${controller.homeDataResponse.value.products?[index].title}',
                      style: FontConstant.lufgaRegular.copyWith(color: colorTheme, fontSize: 20),
                    ),
                    Text(
                      '${controller.homeDataResponse.value.products?[index].description}',
                      style: FontConstant.lufgaRegular.copyWith(color: colorTheme, fontSize: 16),
                    ).marginOnly(top: 10.0),
                    Image.network(controller.homeDataResponse.value.products?[index].images?[0]??"").marginOnly(top: 10.0),
                  ],
                ),
              ).marginAll(8);
            },
            itemCount: controller.homeDataResponse.value.products?.length)),
      ),
    );
  }
}
