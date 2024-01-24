import 'package:flutter/material.dart';
import 'package:flutter_data_base_aplication/models/customer/customer_model.dart';
import 'package:flutter_data_base_aplication/models/customer/customer_services.dart';

class UpdateForm extends StatefulWidget {
  final String customerUpdateID;
  final CustomerModel customerUpd;
  final Function function;
  const UpdateForm(
      {super.key,
      required this.customerUpdateID,
      required this.customerUpd,
      required this.function});

  @override
  State<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  final GraphQLCustomerModel graphQLCustomerModel = GraphQLCustomerModel();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _firstNameController.text = widget.customerUpd.firstName!;
    _lastNameController.text = widget.customerUpd.lastName!;
    _addressController.text = widget.customerUpd.address!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                children: [
                  Macarena(
                      controlador: _firstNameController,
                      nombreDelLabel: "Nombre"),
                  const SizedBox(height: 20),
                  Macarena(
                      controlador: _lastNameController,
                      nombreDelLabel: "Apellido"),
                  const SizedBox(height: 20),
                  Macarena(
                      controlador: _addressController,
                      nombreDelLabel: "Dirección"),
                  const SizedBox(height: 20),
                  TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final updated = widget.customerUpd.toUpdateMap();
                          updated['firstName'] = _firstNameController.text;
                          updated['lastName'] = _lastNameController.text;
                          updated['address'] = _addressController.text;

                          graphQLCustomerModel.updateCustomer(input: updated);
                        }
                        widget.function();
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Actualizar',
                        style: TextStyle(fontSize: 18),
                      ))
                ],
              ),
            )));
  }
}

class Macarena extends StatelessWidget {
  final TextEditingController controlador;
  final String? nombreDelLabel;

  const Macarena({super.key, this.nombreDelLabel, required this.controlador});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controlador,
      decoration: InputDecoration(
        labelText: nombreDelLabel,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      maxLength: 20,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
