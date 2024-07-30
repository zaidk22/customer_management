import 'package:customer_management/presentation/pages/add_edit_customer/views/add_customer_page.dart';
import 'package:customer_management/presentation/pages/home/controllers/home_controller.dart';
import 'package:customer_management/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        
        title: const Text('Customer List'),
      ),
      body: Obx(
        () => controller.customerList.isEmpty
            ? SizedBox(
                height: controller.displaySize(context).height,
                child: const Center(child: Text("No Customer Added")),
              )
            : ListView.builder(
                itemCount: controller.customerList.length,
                itemBuilder: (context, index) {
                  final customer = controller.customerList[index];
                  return Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: index%2==0? Colors.green: Colors.amber
                    ),
                    child: ListTile(
                      title: Text(customer.fullName ?? ""),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(customer.email ?? ""),
                          SizedBox(height: 10,),
                           Text(customer.mobile ?? ""),
                            SizedBox(height: 10,),
                           Text(customer.pan ?? ""),
                    
                                     
                    
                        ],
                      ),
                    
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit,
                            color: Colors.white,
                            ),
                            onPressed: () {
                          
                              Get.toNamed(RoutesNames.addCustomerScreen,
                                  arguments: [
                                    customer,index
                                  ]);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete,
                             color: Colors.white,
                            ),
                            onPressed: () {
                              controller.deleteCustomers(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RoutesNames.addCustomerScreen);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
