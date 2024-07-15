import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapmars/validation/validacao.login.dart';

class LoginPage extends GetView<ValidacaoLogin>{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 7, 24),
      body: Container(
        padding: const EdgeInsets.only(top: 200, left: 40, right: 40),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 300,
              child: Image.asset("assets/images/MapMars.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.usuarioInput,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Usuário",
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: 16,
                ),
              ),
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: controller.senhaInput,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: 16,
                ),
              ),
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 196, 68, 82),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  child: const Text(
                    "Entrar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () => {
                    controller.tryTologin(),
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
