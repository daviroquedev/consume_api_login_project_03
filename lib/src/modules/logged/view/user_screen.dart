import 'package:consume_api_login_project_03/controllers/jwt_decode_controller.dart';
import 'package:consume_api_login_project_03/controllers/login_controller.dart';
import 'package:consume_api_login_project_03/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final String token;
  final LoginController loginController = LoginController();

  UserProfilePage({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final decodedToken = parseJwt(token);
    final userInformation = UserModel.fromToken(decodedToken);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
      ),
      backgroundColor: const Color.fromARGB(255, 70, 1, 76),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 380,
              child: Card(
                elevation: 2,
                color: Color.fromARGB(255, 164, 204, 228),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'IDENTIFICATION CARD',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto'),
                            )
                          ]),
                    ),
                    Container(
                      height: 1,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 10),
                              Container(
                                width: 135,
                                height: 160,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 2,
                                    ),
                                    color:
                                        const Color.fromARGB(255, 2, 113, 173)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    '${userInformation.image}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                '${userInformation.username}',
                                style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Assing'),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 180,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ID ${userInformation.id}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 1),
                                  Text(
                                    '${userInformation.firstName}',
                                    style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('${userInformation.lastName}',
                                      style: const TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  const SizedBox(height: 5),
                                  Text(
                                    '${userInformation.gender}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '${userInformation.email}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                await loginController.removeToken(context);
              },
              child: const Text('DESLOGAR'),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(4),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(225, 176, 93, 221),
                ),
                shadowColor: MaterialStateProperty.all(
                  Colors.black.withOpacity(0.3),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(
                  Colors.white, // Define a cor do texto como branco
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
