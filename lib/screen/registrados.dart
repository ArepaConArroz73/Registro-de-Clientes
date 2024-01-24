import 'package:flutter/material.dart';
import 'package:flutter_data_base_aplication/models/customer/customer_model.dart';
import 'package:flutter_data_base_aplication/models/customer/customer_services.dart';
import 'package:flutter_data_base_aplication/providers/customer_provider.dart';
import 'package:flutter_data_base_aplication/screen/cards/customers_cards.dart';
import 'package:provider/provider.dart';

class Registrados extends StatefulWidget {
  const Registrados({super.key});

  @override
  State<Registrados> createState() => _RegistradosState();
}

class _RegistradosState extends State<Registrados> {
  GraphQLCustomerModel graphQLCustomerModel = GraphQLCustomerModel();
  List<CustomerModel>? registred;

  @override
  void initState() {
    context.read<CustomerProvider>().loadCustomers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes registrados'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 241, 158, 33),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: customerCardList(
              context.watch<CustomerProvider>().registredCustomers),
        ),
      ),
    );
  }
}

List<Widget> customerCardList(List<CustomerModel>? customerObjects) {
  if (customerObjects != null) {
    return customerObjects
        .map((a) => CustomerCards(customerModelObject: a))
        .toList();
  }

  return [const Text('The list is null')];
}
