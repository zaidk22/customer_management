import 'package:customer_management/data/repositories/validation_impl.dart';
import 'package:customer_management/domain/repositories/validation_repo/validation_repo.dart';
import 'package:customer_management/presentation/pages/add_edit_customer/controllers/add_customer_controller.dart';
import 'package:get/get.dart';

class AddCustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCustomerController(), fenix: true);

     Get.lazyPut<IValidationRepo>(() => ValidationRepository(), fenix: true);
  }
}
