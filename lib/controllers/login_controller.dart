import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  Dio dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));
  late SharedPreferences _prefs;

  LoginController() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<String?> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('userToken');
    print('Token recuperado: $token');
    return token;
  }

  Future<String> loginUser(String username, String password) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final token = response.data['token'] as String;

        // Salvar o token no SharedPreferences
        await _prefs.setString('userToken', token);

        return token;
      } else {
        throw Exception('Erro na solicitação');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception('Credenciais inválidas');
      }
      throw Exception('${e.response?.statusCode}');
    }
  }

  Future<void> removeToken(BuildContext context) async {
    try {
      await _prefs.remove('userToken');
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      throw Exception('Erro ao remover o token: $e');
    }
  }
}
