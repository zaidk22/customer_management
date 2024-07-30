import 'package:customer_management/data/local/hive_repository.dart';
import 'package:customer_management/domain/entities/validation/verify_pan_reposne.dart';
import 'package:customer_management/domain/entities/validation/verify_pan_request.dart';
import 'package:customer_management/domain/entities/validation/verify_pin_request.dart';
import 'package:customer_management/domain/repositories/validation_repo/validation_repo.dart';
import 'package:customer_management/routes/routes_name.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import '../../../../domain/entities/customer/customer_model.dart';
import '../../../../domain/entities/validation/verify_pin_reposne.dart';

class AddCustomerController extends GetxController {
  final IValidationRepo _validationRepo = Get.find();
  final HiveCustomerRepository _customerRepository = HiveCustomerRepository();
  final panController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  var customer = Customer().obs;
  int? index;
  RxBool isEdit = false.obs;
  final mobileController = TextEditingController();
  final addressControllers = <AddressController>[].obs;
  RxBool isPanLoading = false.obs;
  RxString validatePan = "Please enter valid PAN".obs;
  RxString validatePin = "Please enter valid PIN Code".obs;
  RxBool isPinLoading = false.obs;

  @override
  void onInit() {
    var dynamic = Get.arguments;
    if (dynamic != null && dynamic is List) {
      customer.value = dynamic[0];
      index = dynamic[1];
      isEdit.value = true;

      initializeCustomer(customer.value);
      verifyPan(customer.value.pan??"");
  
    } else {
      addAddressField();
    }

    super.onInit();
  }

  void initializeCustomer(Customer? customer) {
    if (customer != null) {
      panController.text = customer.pan!;
      nameController.text = customer.fullName!;
      emailController.text = customer.email!;
      mobileController.text = customer.mobile!;
      for (var address in customer.addresses!) {
        addressControllers.add(AddressController(
          addressLine1Controller:
              TextEditingController(text: address.addressLine1),
          addressLine2Controller:
              TextEditingController(text: address.addressLine2),
          postcodeController: TextEditingController(text: address.postcode),
          stateController: TextEditingController(text: address.state),
          cityController: TextEditingController(text: address.city),
        ));
      }
    } else {
      addAddressField();
    }
  }

  void addAddressField() {
    if (addressControllers.length < 10) {
      addressControllers.add(AddressController());
    }
  }

  void removeAddressField(int index) {
    if (addressControllers.length > 1) {
      addressControllers.removeAt(index);
    }
  }

  void addCustomer(Customer customer) async {
    await _customerRepository.addCustomer(customer);

    Get.offAllNamed(RoutesNames.homeScreen);
  }

  void updateCustomer(int index, Customer customer) {
    _customerRepository.updateCustomer(index, customer);
    Get.offAllNamed(RoutesNames.homeScreen);
  }

  void verifyPan(String value) async {
    try {
      isPanLoading.value = true;
      final VerifyPanResponse response =
          await _validationRepo.verifyPan(VerifyPanRequest(panNumber: value));
      if (response.isValid == true) {
        validatePan.value = "";
      } else {}
      isPanLoading.value = false;
    } catch (e) {
      isPanLoading.value = false;
      rethrow;
    }
  }

  void verifyPin(int value, int addressIndex) async {
    try {
      isPinLoading.value = true;
      final VerifyPinResponse response =
          await _validationRepo.verifyPin(VerifyPinRequest(postcode: value));
      if (response.statusCode == 200) {
        addressControllers[addressIndex].stateController.text =
            response.state?.first.name ?? "";
        addressControllers[addressIndex].cityController.text =
            response.city?.first?.name ?? "";
        validatePin.value = "";
      } else {
        validatePin.value = "Invalid PIN Code";
      }
      isPinLoading.value = false;
    } catch (e) {
      isPinLoading.value = false;
      rethrow;
    }
  }
}

class AddressController {
  final TextEditingController addressLine1Controller;
  final TextEditingController addressLine2Controller;
  final TextEditingController postcodeController;
  final TextEditingController stateController;
  final TextEditingController cityController;

  AddressController({
    TextEditingController? addressLine1Controller,
    TextEditingController? addressLine2Controller,
    TextEditingController? postcodeController,
    TextEditingController? stateController,
    TextEditingController? cityController,
  })  : addressLine1Controller =
            addressLine1Controller ?? TextEditingController(),
        addressLine2Controller =
            addressLine2Controller ?? TextEditingController(),
        postcodeController = postcodeController ?? TextEditingController(),
        stateController = stateController ?? TextEditingController(),
        cityController = cityController ?? TextEditingController();
}
