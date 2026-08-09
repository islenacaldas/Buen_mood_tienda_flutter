import 'package:flutter/material.dart';
import 'carrito.dart';

List<Map<String, String>> productos = [
  {"nombre": "Falda", "precio": "\$90.000", "foto": "assets/falda.png"},
  {
    "nombre": "Guantes para alzar pesas",
    "precio": "\$60.000",
    "foto": "assets/guante.png",
  },
  {
    "nombre": "Tenis deportivos",
    "precio": "\$150.000",
    "foto": "assets/tennis.png",
  },
  {
    "nombre": "Top cruzado dama",
    "precio": "\$25.000",
    "foto": "assets/top.png",
  },
  {
    "nombre": "Pantalón licrado dama",
    "precio": "\$90.000",
    "foto": "assets/leggins.png",
  },
  {"nombre": "Pantalón", "precio": "\$90.000", "foto": "assets/pantalon.png"},
];

class HomePrincipal extends StatefulWidget {
  // Recibimos el carrito que viene desde MenuPrincipal.
  final List<Map<String, String>> carrito;

  const HomePrincipal({super.key, required this.carrito});

  @override
  State<HomePrincipal> createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
  void agregarAlCarrito(Map<String, String> producto) {
    setState(() {
      widget.carrito.add(producto);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${producto["nombre"]} fue agregado al carrito'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buen Mood"),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.black,

        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Carrito(carrito: widget.carrito),
                    ),
                  );
                },

                icon: const Icon(Icons.shopping_cart, color: Colors.black),
              ),

              // Número de productos en el carrito
              if (widget.carrito.isNotEmpty)
                Positioned(
                  right: 5,
                  top: 5,

                  child: Container(
                    padding: const EdgeInsets.all(5),

                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),

                    child: Text(
                      '${widget.carrito.length}',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),

      body: ListView.separated(
        itemCount: productos.length,

        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },

        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(productos[index]["nombre"]!),

              subtitle: Text("Precio ${productos[index]["precio"]}"),

              leading: Image.asset(
                productos[index]["foto"]!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),

              trailing: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFE91E63),
                  shape: BoxShape.circle,
                ),

                child: IconButton(
                  onPressed: () {
                    agregarAlCarrito(productos[index]);
                  },

                  icon: const Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
