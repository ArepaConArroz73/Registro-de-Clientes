import 'package:flutter/material.dart';
import 'package:flutter_data_base_aplication/providers/customer_provider.dart';
import 'package:flutter_data_base_aplication/screen/home.dart';
import 'package:flutter_data_base_aplication/screen/registrados.dart';
import 'package:flutter_data_base_aplication/screen/registro_clientes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => CustomerProvider(), child: const DataBaseApp()));
}

class DataBaseApp extends StatelessWidget {
  const DataBaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.orange,
        scaffoldBackgroundColor: const Color.fromRGBO(255, 244, 164, 1),
      ),
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Inicio(),
        '/registro': (context) => const RegistroCliente(),
        '/registrados': (context) => const Registrados()
      },
    );
  }
}
