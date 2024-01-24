import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Clientes "Distribuidora Copa de Oro"'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 241, 158, 33),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 180),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(5, 5),
                              color: Colors.grey,
                              blurRadius: 7)
                        ]),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/registro');
                      },
                      icon: const Icon(
                        Icons.add_circle_outline_rounded,
                        size: 150,
                        color: Colors.black,
                      ),
                      iconSize: 200,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Texto(meme: "Agregar cliente"),
                ],
              ),
              const SizedBox(width: 120),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(5, 5),
                              color: Colors.grey,
                              blurRadius: 7)
                        ]),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/registrados');
                      },
                      icon: const Icon(
                        Icons.people_alt_sharp,
                        size: 150,
                        color: Colors.black,
                      ),
                      iconSize: 200,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Texto(meme: "Registrados")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Texto extends StatelessWidget {
  final String meme;
  const Texto({super.key, required this.meme});

  @override
  Widget build(BuildContext context) {
    return Text(
      meme,
      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
    );
  }
}
