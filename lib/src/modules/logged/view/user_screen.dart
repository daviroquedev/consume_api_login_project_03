import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final Map<String, dynamic> userData;

  const UserProfilePage({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
      ),
      backgroundColor: const Color.fromARGB(255, 70, 1, 76),
      body: Center(
        child: SizedBox(
          height: 350,
          width: 350,
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
                    mainAxisAlignment: MainAxisAlignment.start,
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
                                color: const Color.fromARGB(255, 2, 113, 173)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                userData['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            '${userData['username']}',
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ID ${userData['id']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 1),
                              Text(
                                '${userData['firstName']}',
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('${userData['lastName']}',
                                  style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(height: 5),
                              Text(
                                '${userData['gender']}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${userData['email']}',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ]),
                      )
                    ],
                  ),
                )
                // Linha separadora
              ],
            ),
          ),
        ),
      ),
    );
  }
}
