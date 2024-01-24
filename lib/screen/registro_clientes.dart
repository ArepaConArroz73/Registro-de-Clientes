import 'package:flutter/material.dart';
import 'package:flutter_data_base_aplication/models/customer/customer_services.dart';

class RegistroCliente extends StatefulWidget {
  const RegistroCliente({super.key});

  @override
  State<RegistroCliente> createState() => _RegistroClienteState();
}

class _RegistroClienteState extends State<RegistroCliente> {
  final GraphQLCustomerModel graphQLCustomerModel = GraphQLCustomerModel();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dniController = TextEditingController();
  final _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 247, 201),
      appBar: AppBar(
        title: const Text('Formulario de registro de clientes'),
        backgroundColor: const Color.fromARGB(255, 241, 158, 33),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 300),
          child: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(5, 5), color: Colors.grey, blurRadius: 7)
                ]),
            child: Column(
              children: [
                Container(
                  height: 64,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 89, 178, 250),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            color: Colors.grey,
                            blurRadius: 7,
                            offset: Offset(0, 5)),
                      ]),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Registro de Cliente',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 100),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Macarena(
                                            controlador: _firstNameController,
                                            ancho: 200,
                                            nombreDelLabel: "Nombre"),
                                        const SizedBox(width: 50),
                                        Macarena(
                                            controlador: _lastNameController,
                                            ancho: 200,
                                            nombreDelLabel: "Apellido")
                                      ]),
                                  Macarena(
                                      controlador: _dniController,
                                      ancho: 200,
                                      nombreDelLabel: "Cedula"),
                                  Macarena(
                                      controlador: _addressController,
                                      ancho: 500,
                                      nombreDelLabel: "Dirección"),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          graphQLCustomerModel.createCustomer(
                                              firstname:
                                                  _firstNameController.text,
                                              lastName:
                                                  _lastNameController.text,
                                              dni: int.parse(
                                                  _dniController.text),
                                              address: _addressController.text);

                                          Navigator.pop(context);
                                        }
                                      },
                                      child: const Text('Crear'))
                                ],
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Macarena extends StatelessWidget {
  final double ancho;
  final TextEditingController controlador;
  final String? nombreDelLabel;

  const Macarena(
      {super.key,
      this.nombreDelLabel,
      required this.controlador,
      required this.ancho});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ancho,
      child: TextFormField(
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
      ),
    );
  }
}
