import 'package:flutter/material.dart';

class Carrito extends StatelessWidget {
  final List carrito;

  const Carrito({super.key, required this.carrito});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi carrito'),
        centerTitle: true,
        backgroundColor: const Color(0xFFC2185B),
        foregroundColor: Colors.black,
      ),

      body: carrito.isEmpty
          ? const Center(
              child: Text(
                'Tu carrito está vacío',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: carrito.length,

              itemBuilder: (context, index) {
                final producto = carrito[index];

                return Card(
                  margin: const EdgeInsets.all(10),

                  child: ListTile(
                    leading: Image.asset(
                      producto["foto"],
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),

                    title: Text(
                      producto["nombre"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    subtitle: Text('Precio: ${producto["precio"]}'),

                    trailing: const Icon(
                      Icons.shopping_cart,
                      color: Color(0xFFE91E63),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
