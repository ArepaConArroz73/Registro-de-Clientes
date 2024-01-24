import 'package:flutter/material.dart';
import 'package:flutter_data_base_aplication/models/customer/customer_model.dart';
import 'package:flutter_data_base_aplication/screen/cards/customer_info.dart';
import 'package:flutter_data_base_aplication/screen/cards/delete_customers_button.dart';
import 'package:flutter_data_base_aplication/screen/cards/update_customer.dart';

class CustomerCards extends StatelessWidget {
  final CustomerModel customerModelObject;
  const CustomerCards({super.key, required this.customerModelObject});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(134, 95, 104, 113)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(150, 8, 150, 8),
                child: CustomerInfo(customerObject: customerModelObject),
              ),
              Row(
                children: [
                  UpdateCustomerButton(
                      customer: customerModelObject,
                      customerID: customerModelObject.id!),
                  DeleteCustomer(customerID: customerModelObject.id),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
