import 'package:flutter/material.dart';
import 'Principal.dart';

List<Map> productos = [
  {"nombre": "Falda", "precio": "\$90.000", "foto": "url a colocar"},
  {"nombre": "Balón de fútbol", "precio": "\$60.000", "foto": "url a colocar"},
  {
    "nombre": "Tenis deportivos",
    "precio": "\$150.000",
    "foto": "url a colocar",
  },
  {"nombre": "top cruzado dama", "precio": "\$25.000", "foto": "url a colocar"},
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
          return ListTile(title: Text(productos[index]["nombre"] + " "));
        },
      ),
    );
  }
}
