import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx_controller/home_controller.dart';

// ignore: must_be_immutable
class NativeWidgets extends StatelessWidget {
  NativeWidgets({Key? key}) : super(key: key);

  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Native Widgets'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<HomeController>(
                builder: (_) => Text('User Status : ${homeController.status}')),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(' Native SnackBar')));
              },
              child: const Text('Show Native SnackBar'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => const AlertDialog(
                          title: Text('Native DialogBox'),
                          content: Text('Native DialogBox'),
                        ));
              },
              child: const Text('Show Native DialogBox'),
            ),
            ElevatedButton(
              onPressed: () {
                scaffoldKey.currentState!.showBottomSheet((_) => Container(
                      height: 200,
                      color: Colors.orange,
                    ));
              },
              child: const Text('Show Native Bottom Sheet'),
            ),
          ],
        ),
      ),
    );
  }
}
