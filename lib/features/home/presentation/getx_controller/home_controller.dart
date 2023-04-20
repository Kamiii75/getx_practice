import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  RxString status = 'Online'.obs;
  RxInt followers = 50.obs;

  @override
  onInit() {
    super.onInit();

    // when ever the value changes of status this function calls
    ever(status, (callback) => print('status is changed $callback'));
    // when ever the value changes of status or followers this function calls
    everAll([status, followers],
        (callback) => print('status or followers is changed $callback'));
    // when the value changes of status this function call only once or for the first time

    once(
        status, (callback) => print('status is changed once called $callback'));

    // this will called when the user stops typing used for text fields
    debounce(
        status, (callback) => print('status is changed once called $callback'),
        time: const Duration(seconds: 3));
    //
  }

  updateStatus(newStatus) {
    status.value = newStatus;
    //  update(['status_widget']);
    // because now it is listening to it all time
    // we don't need id
  }

  updateFollowers() {
    followers.value++;
    update(['followers_widget']);
  }

  /// Get Storage Logic !@#$%^&*()!@@@####$%$^$^%&^&&(*&(&(&)*(*)()

  RxString email = ''.obs;
  final storage = GetStorage();
  TextEditingController emailController = TextEditingController();

  void addEmail() {
    storage.write('email', emailController.text);
    emailController.clear();
  }

  void updateEmail() {
    email.value = storage.read('email')??"";
  }
  Future<void> removeEmail() async {
    await storage.remove('email');
  }
  Future<void> listenEmail() async {
     storage.listenKey('email',(_){
       print('value changed');
     });
  }


  /// Get Storage Logic !@#$%^&*()!@@@####$%$^$^%&^&&(*&(&(&)*(*)()
}
