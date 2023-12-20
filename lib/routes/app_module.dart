import "package:consume_api_login_project_03/view/login_screen.dart";
import "package:flutter_modular/flutter_modular.dart";

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const HomeScreen(),
    );
  }
}
