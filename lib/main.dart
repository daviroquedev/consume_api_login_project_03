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

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: _loginController.isLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData && snapshot.data != null) {
              final token = snapshot.data!;

              try {
                return UserProfilePage(
                  token: token,
                );
              } catch (e) {
                return const Scaffold(
                  body: Center(
                    child: Text('Token inválido!'),
                  ),
                );
              }
            } else {
              return const LoginScreen();
            }
          }
        },
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
