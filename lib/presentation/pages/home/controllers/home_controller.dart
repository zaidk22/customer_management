import 'package:customer_management/data/local/hive_repository.dart';
import 'package:customer_management/domain/entities/customer/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HiveCustomerRepository _hiveCustomerRepository =
      HiveCustomerRepository();
  RxBool isLoading = false.obs;
  RxList<Customer> customerList = <Customer>[].obs;
  Size displaySize(BuildContext context) => MediaQuery.sizeOf(context);

  void getCustomers() async {
    isLoading.value = true;
    customerList.value = await _hiveCustomerRepository.getCustomers();
    isLoading.value = false;
  }

  void deleteCustomers(int index) async {
    isLoading.value = true;
    _hiveCustomerRepository.deleteCustomer(index);

    isLoading.value = false;

    getCustomers();
  }

  @override
  void onInit() {
    getCustomers();
    super.onInit();
  }
}
