import 'package:flutter/material.dart';
import 'package:flutter_data_base_aplication/providers/customer_provider.dart';
import 'package:provider/provider.dart';

class AppTemplate extends StatelessWidget {
  const AppTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => CustomerProvider()..loadCustomers(),
      )
    ]);
  }
}
