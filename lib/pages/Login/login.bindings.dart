import 'package:get/get.dart';
import 'package:mapmars/validation/validacao.login.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ValidacaoLogin());    
  }
}