import 'package:customer_management/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Size displaySize(BuildContext context) => MediaQuery.sizeOf(context);

  @override
  void onInit() {
    navigate();
    super.onInit();
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 3));

    Get.offAllNamed(RoutesNames.homeScreen);
  }
}
