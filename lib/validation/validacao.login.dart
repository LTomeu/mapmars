import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:mapmars/pages/rover.list.dart';


class ValidacaoLogin extends GetxController {
  TextEditingController usuarioInput = TextEditingController();
  TextEditingController senhaInput = TextEditingController();
  static const usuario = 'aaa';
  static const senha = '123';
  
  BuildContext? get context => null;

  void tryTologin() {
    switch (usuarioInput.text) {
      case usuario:
        checkPassowrd();
        break;
      case '':
        printError('Usuário não pode ser vazio');
        break;
      default:
        printError('Usuário não encontrado');
    }
  }

  void checkPassowrd() {
    switch (senhaInput.text) {
      case senha:
        login();
        break;
      case '':
        printError('Isira sua senha');
        break;
      default:
        printError('Senha incorreta!');
    }
  }

  void login() {
    Get.to(RoverList());
  }

  void printError(String error) {
    print(error);
  }
}
