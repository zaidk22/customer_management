import 'package:customer_management/presentation/pages/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class Homebindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
