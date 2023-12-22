import 'package:consume_api_login_project_03/controllers/route_controller.dart';
import 'package:consume_api_login_project_03/src/modules/auth/view/login_screen.dart';
import 'package:consume_api_login_project_03/controllers/login_controller.dart';
import 'package:consume_api_login_project_03/src/modules/logged/view/user_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LoginController _loginController = LoginController();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<String?>(
        future: _loginController.isLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          return RouterController(snapshot: snapshot);
        },
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/profile': (context) => UserProfilePage(token: ''),
      },
    );
  }
}
