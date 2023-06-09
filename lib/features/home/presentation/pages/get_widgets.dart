import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx_controller/home_controller.dart';

// ignore: must_be_immutable
class GetWidgets extends StatelessWidget {
   GetWidgets({Key? key}) : super(key: key);


  HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Widgets'),
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
                Get.snackbar("snack bar", 'snack bar from GetX',
                    snackPosition: SnackPosition.BOTTOM,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    icon: const Icon(Icons.warning),
                    mainButton: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'My Cart',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    borderRadius: 12,
                    backgroundColor: Colors.blue,
                    colorText: Colors.black);
              },
              child: const Text('Show SnackBar'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                    title: 'DialogBox',
                    content: Text('Are you sure?'),
                    backgroundColor: Colors.white70,
                    textCancel: 'No',
                    textConfirm: "Yes",
                    cancelTextColor: Colors.redAccent,
                    confirmTextColor: Colors.lightBlueAccent,
                    onCancel: () {},
                    onConfirm: () {},
                    barrierDismissible: false);
              },
              child: const Text('Show DialogBox'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                    SizedBox(
                      height: 200,
                      // decoration:const BoxDecoration(
                      //   color:Colors.amber ,
                      //     borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(12),
                      //   topRight: Radius.circular(12),
                      // ),
                      // ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(),
                          const Icon(Icons.message),
                          ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('Back'))
                        ],
                      ),
                    ),
                    backgroundColor: Colors.amber,
                    isDismissible: false,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)));
              },
              child: const Text('Show Bottom Sheet'),
            ),

          ],
        ),
      ),
    );
  }
}
