import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/features/home/presentation/getx_controller/home_controller.dart';
import 'package:getx_practice/features/home/presentation/pages/get_widgets.dart';
import 'package:getx_practice/features/home/presentation/pages/native_widgets.dart';

import 'get_storage_page.dart';

// instead of StatelessWidget we use GetWidget so we don't have to call Get.find
class HomePage extends GetWidget<HomeController> {
  HomePage({Key? key}) : super(key: key);

  // HomeController homeController = Get.put(HomeController(),permanent: true);
  // HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetX<HomeController>(
                builder: (_) =>
                    Text('User Status : ${controller.status.value}')),
            GetBuilder<HomeController>(
                id: 'followers_widget',
                builder: (_) {
                  print('Followers widget builds');
                  return Text('Follower : ${controller.followers.value}');
                }),
            Obx(() {
              print('Status widget builds');
              return Text('Status Obx: ${controller.status.value}');
            }),
            // GetBuilder<HomeController>(
            //     init: HomeController(),
            //     builder: (homeController) => Text(
            //         'used if not initialized above : ${homeController.status}')),
            const Text(
                'Note:  we only need to initialize GetXController Class once.'),
            const Text(
                'Either using Get.put or the init property of the GetBuilder '),
            const Text(
                'After that in future, where ever we want to use that Controller '
                '\nwe can simply write  Get.find'),
            ElevatedButton(
                onPressed: () => controller.updateStatus('OffLine'),
                child: const Text('Logout')),
            ElevatedButton(
                onPressed: () => controller.updateFollowers(),
                child: const Text('Add followers')),
            ElevatedButton(
              onPressed: () => Get.to(() => GetWidgets()),
              child: const Text('Get Widgets'),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => NativeWidgets()),
              child: const Text('Native Widgets'),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() =>  GetStoragePage()),
              child: const Text('Get Storage'),
            ),
          ],
        ),
      ),
    );
  }
}
