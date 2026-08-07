import 'package:flutter/material.dart';

import 'Principal.dart';

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
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.fitness_center_outlined),
            SizedBox(width: 8),
            Text("Buen Mood"),
          ],
        ),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.black,
      ),
    );
  }
}
