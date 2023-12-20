import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController {
  Dio dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));
  late SharedPreferences _prefs;

  HomeController() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<Map> loginUser(String username, String password) async {
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
        final Map userData = response.data;
        print('USER DATA $userData');

        // Salvar o token no SharedPreferences
        await _prefs.setString('userToken', token);

        return userData;
      } else {
        throw Exception('Erro na solicitação POST');
      }
    } catch (e) {
      throw Exception('Erro de rede: $e');
    }
  }
}
