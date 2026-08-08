import 'package:flutter/material.dart';
import 'Principal.dart';

List<Map> productos = [
  {"nombre": "Falda", "precio": "\$90.000", "foto": "assets/falda.png"},
  {
    "nombre": "guantes para alzar pesas",
    "precio": "\$60.000",
    "foto": "assets/guante.png",
  },
  {
    "nombre": "Tenis deportivos",
    "precio": "\$150.000",
    "foto": "assets/tennis.png",
  },
  {
    "nombre": "top cruzado dama",
    "precio": "\$25.000",
    "foto": "assets/top.png",
  },
];

class HomePrincipal extends StatelessWidget {
  const HomePrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Icon(Icons.fitness_center_outlined),
            SizedBox(width: 8),
            Text("Buen Mood"),
          ],
        ),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.black,
      ),
      body: ListView.separated(
        itemCount: productos.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(productos[index]["nombre"] + " "),
              subtitle: Text("Precio " + productos[index]["precio"]),
              trailing: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFE91E63),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(8),
                child: Icon(Icons.add_shopping_cart, color: Colors.white),
              ),
              leading: Image(image: NetworkImage(productos[index]["foto"])),
            ),
          );
        },
      ),
    );
  }
}
