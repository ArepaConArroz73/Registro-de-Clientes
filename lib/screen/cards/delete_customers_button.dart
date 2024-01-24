import 'package:flutter/material.dart';
import 'package:flutter_data_base_aplication/models/customer/customer_services.dart';
import 'package:flutter_data_base_aplication/providers/customer_provider.dart';
import 'package:provider/provider.dart';

class DeleteCustomer extends StatelessWidget {
  final String? customerID;
  final GraphQLCustomerModel graphQLCustomerModel = GraphQLCustomerModel();
  DeleteCustomer({super.key, required this.customerID});

  @override
  Widget build(BuildContext context) {
    var customerProvider = context.read<CustomerProvider>();
    return IconButton(
        onPressed: () {
          graphQLCustomerModel.deleteCustomer(id: customerID!);
          customerProvider.updateCustomersList();
        },
        icon: Icon(Icons.delete_forever));
  }
}
