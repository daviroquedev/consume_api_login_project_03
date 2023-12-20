import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final Map<String, dynamic> userData;

  const UserProfilePage({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Usuário'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16.0),
          elevation: 4,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userData['image']),
            ),
            title: Text('ID: ${userData['id']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Username: ${userData['username']}'),
                Text('Email: ${userData['email']}'),
                Text('Nome: ${userData['firstName']} ${userData['lastName']}'),
                Text('Gênero: ${userData['gender']}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
