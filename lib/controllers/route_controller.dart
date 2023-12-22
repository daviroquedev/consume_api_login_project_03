import 'package:consume_api_login_project_03/src/modules/auth/view/login_screen.dart';
import 'package:consume_api_login_project_03/src/modules/logged/view/user_screen.dart';
import 'package:flutter/material.dart';

class RouterController extends StatelessWidget {
  final AsyncSnapshot<String?> snapshot;

  const RouterController({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
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
          print('Erro ao decodificar token: $e');

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
  }
}
