import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/customer/customer_model.dart';
import '../controllers/add_customer_controller.dart';

class AddCustomerPage extends GetView<AddCustomerController> {


  AddCustomerPage({super.key,});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(controller.customer == null ? 'Add Customer' : 'Edit Customer'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Obx(
                    () => TextFormField(
                      controller: controller.panController,
                      decoration: InputDecoration(
                          labelText: 'PAN',
                          border: const OutlineInputBorder(),
                          suffix: controller.isPanLoading.isTrue
                              ? const Align(
                                  alignment: Alignment.bottomRight,
                                  child: CircularProgressIndicator())
                              : SizedBox(),
                          errorText: controller.validatePan.value),
                      onChanged: (value) {
                        if (value.length == 10) {
                          controller.verifyPan(value);
                        }
                      },
                      maxLength: 10,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                        labelText: 'Full Name', border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length > 140) {
                        return 'Please enter a valid name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                        labelText: 'Email', border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length > 255) {
                        return 'Please enter a valid email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.mobileController,
                    decoration: const InputDecoration(
                        labelText: 'Mobile Number',
                        prefixText: "+91-",
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty || value.length<10
                          ) {
                        return 'Please enter a valid mobile number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Obx(() => Column(
                        children: List.generate(
                            controller.addressControllers.length, (index) {
                          final addressController =
                              controller.addressControllers[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Address ${index + 1}'),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller: addressController
                                        .addressLine1Controller,
                                    decoration: const InputDecoration(
                                        labelText: 'Address Line 1',
                                        border: OutlineInputBorder()),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a valid address';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller: addressController
                                        .addressLine2Controller,
                                    decoration: const InputDecoration(
                                        labelText: 'Address Line 2',
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(height: 10),
                                  Obx(
                                    () => TextFormField(
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: false),
                                      controller:
                                          addressController.postcodeController,
                                      maxLength: 6,
                                      decoration: InputDecoration(
                                          labelText: 'Pincode',
                                          border: const OutlineInputBorder(),
                                          suffix: controller.isPinLoading.isTrue
                                              ? const Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child:
                                                      CircularProgressIndicator())
                                              : SizedBox(),
                                          errorText:
                                              controller.validatePin.value),
                                      // validator: (value) {
                                      //   if (value == null ||
                                      //       value.length<6) {
                                      //     return 'Please enter a valid pincode';
                                      //   }
                                      //   return null;
                                      // },
                                      onChanged: (value) {
                                        //  if (value == 6) {
                                        controller.verifyPin(
                                            int.tryParse(value) ?? 0, index);
                                        //   }
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller:
                                        addressController.stateController,
                                    decoration: const InputDecoration(
                                        labelText: 'State',
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller:
                                        addressController.cityController,
                                    decoration: const InputDecoration(
                                        labelText: 'City',
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () =>
                                        controller.removeAddressField(index),
                                    child: const Text('Delete Address'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      )),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: controller.addAddressField,
                    child: const Text('Add Address'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final addresses = controller.addressControllers
                            .map((addressController) => Address(
                                  addressLine1: addressController
                                      .addressLine1Controller.text,
                                  addressLine2: addressController
                                      .addressLine2Controller.text,
                                  postcode:
                                      addressController.postcodeController.text,
                                  state: addressController.stateController.text,
                                  city: addressController.cityController.text,
                                ))
                            .toList();

                        final newCustomer = Customer(
                          pan: controller.panController.text,
                          fullName: controller.nameController.text,
                          email: controller.emailController.text,
                          mobile: controller.mobileController.text,
                          addresses: addresses,
                        );

                        if (controller.isEdit == false) {
                          controller.addCustomer(newCustomer);
                        } else {
                          controller.updateCustomer(controller.index!, newCustomer);
                        }

                  
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
