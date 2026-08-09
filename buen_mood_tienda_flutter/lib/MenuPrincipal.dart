import 'package:flutter/material.dart';
import 'HomePrincipal.dart';
import 'carrito.dart';

class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({super.key});

  @override
  State<MenuPrincipal> createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  // Este será el carrito principal de nuestra aplicación.
  List<Map<String, String>> carrito = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BuenMood'),
        centerTitle: true,
        backgroundColor: const Color(0xFFC2185B),
        foregroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'que deseas hacer?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 40),

            // BOTÓN VER PRODUCTOS
            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePrincipal(carrito: carrito),
                    ),
                  );
                },

                icon: const Icon(Icons.shopping_bag, color: Colors.black),

                label: const Text(
                  'Ver productos',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC2185B),
                  padding: const EdgeInsets.all(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // BOTÓN MI CARRITO
            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Carrito(carrito: carrito),
                    ),
                  );
                },

                icon: const Icon(Icons.shopping_cart, color: Colors.black),

                label: const Text(
                  'Mi carrito',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE91E63),
                  padding: const EdgeInsets.all(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
