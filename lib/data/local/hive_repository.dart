
import 'package:hive/hive.dart';
import '../../domain/entities/customer/customer_model.dart';




class HiveCustomerRepository {
 
  static final HiveCustomerRepository _instance = HiveCustomerRepository._internal();


  HiveCustomerRepository._internal();

  
  factory HiveCustomerRepository() {
    return _instance;
  }


  final Box _box = Hive.box('customers');


  List<Customer> getCustomers() {
    return _box.values.cast<Customer>().toList();
  }


  Future<void> addCustomer(Customer customer) async {
    await _box.add(customer);
  }


  void updateCustomer(int index, Customer customer) {
    _box.putAt(index, customer);
  }


  void deleteCustomer(int index) {
    _box.deleteAt(index);
  }
}
