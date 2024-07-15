import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MovRover extends StatefulWidget {
  final int x1, y1, x2, y2;
  final String direcao1, direcao2;
  final Function(int, int, String, int, int, String) onUpdate;

  MovRover(
      {required this.x1,
      required this.y1,
      required this.direcao1,
      required this.x2,
      required this.y2,
      required this.direcao2,
      required this.onUpdate});

  @override
  _MovRoverState createState() => _MovRoverState();
}

class _MovRoverState extends State<MovRover> {
  late int x1, y1, x2, y2;
  late String direcao1, direcao2;
  final TextEditingController rover1Controller = TextEditingController();
  final TextEditingController rover2Controller = TextEditingController();
  String collisionMessage = '';

  @override
  void initState() {
    super.initState();
    x1 = widget.x1;
    y1 = widget.y1;
    direcao1 = widget.direcao1;
    x2 = widget.x2;
    y2 = widget.y2;
    direcao2 = widget.direcao2;
  }

  void moveRover(String commands, int rover) {
    for (var command in commands.split('')) {
      if (rover == 1) {
        if (command == 'L') {
          turnLeft(1);
        } else if (command == 'R') {
          turnRight(1);
        } else if (command == 'M') {
          moveForward(1);
        }
      } else {
        if (command == 'L') {
          turnLeft(2);
        } else if (command == 'R') {
          turnRight(2);
        } else if (command == 'M') {
          moveForward(2);
        }
      }
    }

    checkCollision();
  }

  void turnLeft(int rover) {
    setState(() {
      if (rover == 1) {
        if (direcao1 == 'N')
          direcao1 = 'W';
        else if (direcao1 == 'W')
          direcao1 = 'S';
        else if (direcao1 == 'S')
          direcao1 = 'E';
        else if (direcao1 == 'E') direcao1 = 'N';
      } else {
        if (direcao2 == 'N')
          direcao2 = 'W';
        else if (direcao2 == 'W')
          direcao2 = 'S';
        else if (direcao2 == 'S')
          direcao2 = 'E';
        else if (direcao2 == 'E') direcao2 = 'N';
      }
    });
  }

  void turnRight(int rover) {
    setState(() {
      if (rover == 1) {
        if (direcao1 == 'N')
          direcao1 = 'E';
        else if (direcao1 == 'E')
          direcao1 = 'S';
        else if (direcao1 == 'S')
          direcao1 = 'W';
        else if (direcao1 == 'W') direcao1 = 'N';
      } else {
        if (direcao2 == 'N')
          direcao2 = 'E';
        else if (direcao2 == 'E')
          direcao2 = 'S';
        else if (direcao2 == 'S')
          direcao2 = 'W';
        else if (direcao2 == 'W') direcao2 = 'N';
      }
    });
  }

  void moveForward(int rover) {
    setState(() {
      if (rover == 1) {
        int newX = x1, newY = y1;
        if (direcao1 == 'N')
          newY += 1;
        else if (direcao1 == 'E')
          newX += 1;
        else if (direcao1 == 'S')
          newY -= 1;
        else if (direcao1 == 'W') newX -= 1;

        if (newX != x2 || newY != y2) {
          x1 = newX;
          y1 = newY;
        }
      } else {
        int newX = x2, newY = y2;
        if (direcao2 == 'N')
          newY += 1;
        else if (direcao2 == 'E')
          newX += 1;
        else if (direcao2 == 'S')
          newY -= 1;
        else if (direcao2 == 'W') newX -= 1;

        if (newX != x1 || newY != y1) {
          x2 = newX;
          y2 = newY;
        }
      }
    });
  }

  void checkCollision() {
    if (x1 == x2 && y1 == y2) {
      setState(() {
        collisionMessage = 'Os rovers estão colidindo!';
      });
    } else {
      setState(() {
        collisionMessage = '';
      });
    }
  }

  void submitCommands() {
    moveRover(rover1Controller.text, 1);
    moveRover(rover2Controller.text, 2);
    widget.onUpdate(x1, y1, direcao1, x2, y2, direcao2);
    if (collisionMessage.isEmpty) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Mover Rovers',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Rover 1 - Posição Atual: ($x1, $y1) | Direção Atual: $direcao1',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
            TextField(
              controller: rover1Controller,
              decoration: const InputDecoration(
                  labelText: 'Comandos Rover 1 (L, R, M)',
                  labelStyle: TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[LRM]'))
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Rover 2 - Posição Atual: ($x2, $y2) | Direção Atual: $direcao2',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
            TextField(
              controller: rover2Controller,
              decoration: const InputDecoration(
                  labelText: 'Comandos Rover 2 (L, R, M)',
                  labelStyle: TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[LRM]'))
              ],
            ),
            const SizedBox(height: 20),
            if (collisionMessage.isNotEmpty)
              Text( 
                collisionMessage,
                semanticsLabel: 'Os rovers estão colidindo!',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 196, 68, 82),
              ),
              onPressed: submitCommands,
              child: const Text('Enviar Comandos',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 7, 24),
    );
  }
}
