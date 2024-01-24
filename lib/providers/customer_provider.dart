import 'package:flutter/material.dart';
import 'package:flutter_data_base_aplication/models/customer/customer_services.dart';
import 'package:flutter_data_base_aplication/models/customer/customer_model.dart';

class CustomerProvider extends ChangeNotifier {
  GraphQLCustomerModel graphQLCustomerModel = GraphQLCustomerModel();
  List<CustomerModel>? _customer;
  List<CustomerModel>? get registredCustomers => _customer;

  Future<void> loadCustomers() async {
    _customer = [];
    _customer = await graphQLCustomerModel.getCustomersIn();
    notifyListeners();
  }

  Future<void> updateCustomersList() async {
    _customer = null;
    _customer = await graphQLCustomerModel.getCustomersIn();
    notifyListeners();
  }
}
