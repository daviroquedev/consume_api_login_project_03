import 'package:consume_api_login_project_03/routes/app_module.dart';
import 'package:consume_api_login_project_03/routes/routes_module.dart';
import 'package:consume_api_login_project_03/src/modules/auth/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PROJECT 03',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
