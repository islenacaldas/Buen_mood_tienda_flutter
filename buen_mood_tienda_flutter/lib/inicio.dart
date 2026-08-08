import 'package:flutter/material.dart';
import 'MenuPrincipal.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuenMood',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BuenMood'),
          centerTitle: true,
          backgroundColor: const Color(0xFFC2185B),
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              const Text(
                'Bienvenida a BuenMood',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'Ropa deportiva para mujer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFFC2185B),
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              const CircleAvatar(
                radius: 90,
                backgroundColor: Color(0xFFC2185B),
                child: Icon(
                  Icons.fitness_center,
                  color: Colors.black,
                  size: 90,
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'BuenMood es una aplicación de inicio para una marca de ropa deportiva femenina. Su objetivo es presentar prendas cómodas, modernas y funcionales para mujeres que desean entrenar con estilo y seguridad.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),

              const SizedBox(height: 25),

              Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MenuPrincipal(),
                        ),
                      );
                    },
                    child: const Text('Ingresar'),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          backgroundColor: const Color(0xFFC2185B),
          child: const Icon(Icons.arrow_forward, color: Colors.black, size: 35),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
