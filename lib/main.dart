import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_practice/features/home/presentation/getx_controller/home_binding.dart';
import 'package:getx_practice/features/home/presentation/pages/home_page.dart';
import 'package:get/get.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HomeBindings().dependencies();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      smartManagement: SmartManagement.full,
      debugShowCheckedModeBanner: false,
      title: 'Flutter GetX',
      initialBinding: HomeBindings(),
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );

  }

}

