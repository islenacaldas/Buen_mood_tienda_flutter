import 'package:flutter/material.dart';

import 'Principal.dart';

List<Map> productos = [
  {"nombre": "Falda", "precio": "\$90.000", Image=
  )},
  {
    "nombre": "Balón de fútbol",
    "precio": "\$60.000",
    "icono": Icons.sports_soccer,
  },
  {
    "nombre": "Tenis deportivos",
    "precio": "\$150.000",
    "icono": Icons.directions_run,
  },
  {
    "nombre": "Botella deportiva",
    "precio": "\$25.000",
    "icono": Icons.water_drop,
  },
];

class HomePrincipal extends StatefulWidget {
  const HomePrincipal({super.key});

  @override
  State<HomePrincipal> createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
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
      body: Column(children: [ListTile(title: Text("productos"))]),
    );
  }
}
