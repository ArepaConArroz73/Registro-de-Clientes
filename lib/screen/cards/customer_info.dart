import 'package:flutter/material.dart';
import 'package:flutter_data_base_aplication/models/customer/customer_model.dart';

class CustomerInfo extends StatelessWidget {
  final CustomerModel customerObject;
  const CustomerInfo({super.key, required this.customerObject});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 250,
            child: Column(
              children: [
                TextCustomer(
                    title: "Nombre: ", content: "${customerObject.firstName}"),
                TextCustomer(
                    title: "Apellido: ", content: "${customerObject.lastName}"),
              ],
            ),
          ),
          SizedBox(
            width: 250,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: TextCustomer(
                  title: "C.I: ", content: "${customerObject.dni}"),
            ),
          ),
          SizedBox(
            width: 210,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: TextCustomer(
                  title: "Dirección: ", content: "${customerObject.address}"),
            ),
          ),
        ],
      ),
    );
  }
}

class TextCustomer extends StatelessWidget {
  final String title;
  final String content;
  const TextCustomer({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        Text(
          content,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
