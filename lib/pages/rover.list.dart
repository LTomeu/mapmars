import 'package:flutter/material.dart';
import 'package:mapmars/pages/forms/mov.rover.dart';
import 'package:mapmars/pages/login/login.page.dart';

class RoverList extends StatefulWidget {
  @override
  _RoverListState createState() => _RoverListState();
}

class _RoverListState extends State<RoverList> {
  int x1 = 1, y1 = 2;
  int x2 = 3, y2 = 3;
  String direcao1 = 'N', direcao2 = 'E';

  void updateRoverPositions(int newX1, int newY1, String newdirecao1,
      int newX2, int newY2, String newdirecao2) {
    setState(() {
      x1 = newX1;
      y1 = newY1;
      direcao1 = newdirecao1;
      x2 = newX2;
      y2 = newY2;
      direcao2 = newdirecao2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/icons/logo.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            color: Color.fromARGB(255, 196, 68, 82),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: const Text(
                'Rover 1',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Posição: ($x1, $y1)',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Direção: $direcao1',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: const Text(
                'Rover 2',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Posição: ($x2, $y2)',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Direção: $direcao2',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 196, 68, 82),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovRover(
                      x1: x1, y1: y1, direcao1: direcao1,
                      x2: x2, y2: y2, direcao2: direcao2,
                      onUpdate: updateRoverPositions,
                    ),
                  ),
                );
              },
              child: const Text('Mover Rovers', style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 7, 24),
    );
  }
}
