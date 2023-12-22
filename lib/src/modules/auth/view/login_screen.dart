import 'package:consume_api_login_project_03/controllers/login_controller.dart';
import 'package:consume_api_login_project_03/src/modules/logged/view/user_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginScreen> {
  bool _obscureText = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController _loginController = LoginController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu nome de usuário';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira sua senha';
    }
    return null;
  }

  Future<void> _handleLogin() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (_formKey.currentState!.validate()) {
      try {
        String dataUser = await _loginController.loginUser(username, password);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserProfilePage(token: dataUser),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$e'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(72, 3, 137, 30),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(189, 164, 3, 179),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 255, 154, 248).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/logo_branca.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Column(
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          fillColor: Color.fromARGB(255, 242, 35, 201),
                          filled: true,
                          labelText: 'Insira seu nome de usuário',
                          hintText: 'Usuário',
                          hintStyle: TextStyle(
                            color: Colors.black26,
                            fontSize: 16,
                          ),
                          focusColor: Color.fromARGB(255, 249, 114, 220),
                          border: OutlineInputBorder(),
                        ),
                        validator: _validateUsername,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(255, 242, 35, 201),
                          filled: true,
                          labelText: 'Insira sua Senha',
                          hintText: 'Senha',
                          hintStyle: const TextStyle(
                              color: Colors.black26, fontSize: 16),
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                        validator: _validatePassword,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _handleLogin,
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(
                              4), // Adiciona elevação
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 32),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(72, 3, 137, 30),
                          ),
                          shadowColor: MaterialStateProperty.all(
                            Colors.black.withOpacity(0.3),
                          ),
                        ),
                        child: const Text('Login',
                            style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
