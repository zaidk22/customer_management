import 'package:customer_management/presentation/splash/controller/splash_controller.dart';
import 'package:get/instance_manager.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
  }
}
