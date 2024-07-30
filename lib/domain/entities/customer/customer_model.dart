import 'package:hive/hive.dart';

part 'customer_model.g.dart';

@HiveType(typeId: 0)
class Customer extends HiveObject {
  @HiveField(0)
  String? pan;
  
  @HiveField(1)
  String? fullName;
  
  @HiveField(2)
  String? email;
  
  @HiveField(3)
  String? mobile;
  
  @HiveField(4)
  List<Address>? addresses;
  
  Customer({
     this.pan,
   this.fullName,
    this.email,
     this.mobile,
    this.addresses,
  });
}

@HiveType(typeId: 1)
class Address extends HiveObject {
  @HiveField(0)
  String? addressLine1;
  
  @HiveField(1)
  String? addressLine2;
  
  @HiveField(2)
  String? postcode;
  
  @HiveField(3)
  String? state;
  
  @HiveField(4)
  String? city;
  
  Address({
  this.addressLine1,
   this.addressLine2,
     this.postcode,
     this.state,
    this.city,
  });
}
