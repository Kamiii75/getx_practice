import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {

    // Get.put<HomeController>(HomeController(), permanent: true);
    Get.lazyPut(() => HomeController(),fenix: true);
  }

}