
import 'package:customer_management/presentation/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
     height: controller.displaySize(context).height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
     
     
            colors: [
            Colors.red,
            Colors.yellow,
            Colors.green,
             Colors.blue,
              Colors.indigo,
              Colors.red,
          ])
        ),
        child: const Center(child: Text("Welcome",
        style:  TextStyle(
          color: Colors.white,
          fontSize: 32
        ),
        )),
      ),
    );
  }
}