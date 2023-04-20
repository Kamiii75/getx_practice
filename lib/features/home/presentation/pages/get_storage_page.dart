import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_practice/features/home/presentation/getx_controller/home_controller.dart';

// ignore: must_be_immutable
class GetStoragePage extends GetView<HomeController> {
  const GetStoragePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Storage'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text('Results'),
              const SizedBox(
                height: 10,
              ),
              Obx(() => Text(controller.email.value)),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (GetUtils.isEmail(controller.emailController.text)) {
                      controller.addEmail();
                    } else {
                      Get.snackbar('Error', 'Email is incorrect',
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
                    }
                  },
                  child: const Text('Submit')),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.updateEmail();
                  },
                  child: const Text('View')),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.removeEmail();
                  },
                  child: const Text('Remove Email')),
            ],
          ),
        ),
      ),
    );
  }
}
