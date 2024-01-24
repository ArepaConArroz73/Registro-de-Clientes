import 'package:flutter/material.dart';
import 'package:flutter_data_base_aplication/models/customer/customer_model.dart';
import 'package:flutter_data_base_aplication/providers/customer_provider.dart';
import 'package:flutter_data_base_aplication/screen/cards/update_customer_form.dart';
import 'package:provider/provider.dart';

class UpdateCustomerButton extends StatefulWidget {
  final String customerID;
  final CustomerModel customer;
  const UpdateCustomerButton(
      {super.key, required this.customerID, required this.customer});

  @override
  State<UpdateCustomerButton> createState() => _UpdateCustomerButtonState();
}

class _UpdateCustomerButtonState extends State<UpdateCustomerButton> {
  @override
  Widget build(BuildContext context) {
    var customerProviderRead = context.read<CustomerProvider>();
    return IconButton(
        onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                insetPadding: const EdgeInsets.all(20),
                title: const Text(
                    '                 Actualizacion de datos                 '),
                content: UpdateForm(
                    customerUpdateID: widget.customerID,
                    customerUpd: widget.customer,
                    function: customerProviderRead.updateCustomersList),
              ),
            ),
        icon: const Icon(Icons.perm_contact_cal_outlined));
  }
}
