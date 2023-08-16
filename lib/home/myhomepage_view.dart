import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/home/myhomepage_controller.dart';

class MyHomePageView extends GetView<MyHomePageController> {
  const MyHomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text ( 'You have Incremented counter value to :'),
            Obx(() => Text(
                  '${controller.count.value}',
                  style: Theme.of(context).textTheme.headline4,
                )),
          ],
        ),

      ),
    );
  }
}
