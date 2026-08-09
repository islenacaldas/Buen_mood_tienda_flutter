import 'package:flutter/material.dart';

class Carrito extends StatefulWidget {
  final List carrito;

  const Carrito({super.key, required this.carrito});

  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  // Agrupa los productos iguales y calcula sus cantidades.
  Map<String, Map<String, dynamic>> obtenerProductosAgrupados() {
    Map<String, Map<String, dynamic>> productosAgrupados = {};

    for (var producto in widget.carrito) {
      String nombre = producto["nombre"];

      if (productosAgrupados.containsKey(nombre)) {
        productosAgrupados[nombre]!["cantidad"]++;
      } else {
        productosAgrupados[nombre] = {
          "nombre": producto["nombre"],
          "precio": producto["precio"],
          "foto": producto["foto"],
          "cantidad": 1,
        };
      }
    }

    return productosAgrupados;
  }

  // Convierte "$90.000" en 90000.
  double convertirPrecio(String precio) {
    String precioLimpio = precio
        .replaceAll('\$', '')
        .replaceAll('.', '')
        .replaceAll(',', '');

    return double.tryParse(precioLimpio) ?? 0;
  }

  // Calcula el total de todo el carrito.
  double calcularTotal() {
    double total = 0;

    final productosAgrupados = obtenerProductosAgrupados();

    for (var producto in productosAgrupados.values) {
      double precio = convertirPrecio(producto["precio"]);
      int cantidad = producto["cantidad"];

      total += precio * cantidad;
    }

    return total;
  }

  // Formatea el número como pesos colombianos.
  String formatoPrecio(double precio) {
    return '\$${precio.toStringAsFixed(0).replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '.')}';
  }

  @override
  Widget build(BuildContext context) {
    final productosAgrupados = obtenerProductosAgrupados();
    final productos = productosAgrupados.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi carrito'),
        centerTitle: true,
        backgroundColor: const Color(0xFFC2185B),
        foregroundColor: Colors.black,
      ),

      body: widget.carrito.isEmpty
          ? const Center(
              child: Text(
                'Tu carrito está vacío',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            )
          : Column(
              children: [
                // LISTA DE PRODUCTOS
                Expanded(
                  child: ListView.builder(
                    itemCount: productos.length,

                    itemBuilder: (context, index) {
                      final producto = productos[index];

                      double precio = convertirPrecio(producto["precio"]);

                      int cantidad = producto["cantidad"];

                      double subtotal = precio * cantidad;

                      return Card(
                        margin: const EdgeInsets.all(10),

                        child: Padding(
                          padding: const EdgeInsets.all(10),

                          child: Row(
                            children: [
                              // IMAGEN
                              Image.asset(
                                producto["foto"],
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),

                              const SizedBox(width: 15),

                              // INFORMACIÓN DEL PRODUCTO
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      producto["nombre"],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    Text('Precio: ${producto["precio"]}'),

                                    const SizedBox(height: 5),

                                    Text(
                                      'Cantidad: $cantidad',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    Text(
                                      'Subtotal: ${formatoPrecio(subtotal)}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFC2185B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // TOTAL
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),

                  decoration: const BoxDecoration(color: Color(0xFFFCE4EC)),

                  child: Column(
                    children: [
                      const Text(
                        'Total del carrito',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        formatoPrecio(calcularTotal()),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC2185B),
                        ),
                      ),

                      const SizedBox(height: 15),

                      SizedBox(
                        width: double.infinity,

                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Compra'),

                                  content: const Text(
                                    '¡Gracias por tu compra en BuenMood!',
                                  ),

                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Aceptar'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFC2185B),

                            padding: const EdgeInsets.all(15),
                          ),

                          child: const Text(
                            'Comprar',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
