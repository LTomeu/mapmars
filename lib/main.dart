import 'package:flutter/material.dart';
import 'package:mapmars/pages/login/login.page.dart';
import 'package:mapmars/routes/app.routes.dart';
import 'package:get/get.dart';

import 'pages/login/login.bindings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: LoginBindings(),
        title: 'MapMars',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        routes: {
          AppRoutes.home: (_) => const LoginPage(),
        },      
    );
  }
}
