import 'package:customer_management/domain/entities/customer/customer_model.dart';
import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({super.key,this.customer});
  final Customer? customer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.2),


      ),
      child: Column(
        children: [

          Text(customer?.fullName??"")


        ],
      ),
    );
  }
}
