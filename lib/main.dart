import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'data/controller.dart';
import 'data/customtheme.dart';
import 'views/HomeScreen.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ControllerSession appController = Get.put(ControllerSession());

  @override
  Widget build(BuildContext context) {
    appController.loadDataIfSaved();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
            .copyWith(statusBarIconBrightness: Brightness.light));
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PiggyBank App',
        color:
            CustomTheme.background,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          fontFamily: 'Montserrat',
          primaryColor: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(
                currentIndex: 0,
              ));
  }
}
