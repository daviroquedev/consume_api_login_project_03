import "package:consume_api_login_project_03/src/modules/auth/view/login_screen.dart";
import "package:consume_api_login_project_03/src/modules/logged/view/user_screen.dart";
import "package:flutter_modular/flutter_modular.dart";

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const LoginScreen(),
    );
  }
}
