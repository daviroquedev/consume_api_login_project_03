class UserModel {
  final dynamic id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final dynamic iat;
  final dynamic exp;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.iat,
    required this.exp,
  });

  factory UserModel.fromToken(Map<String, dynamic> token) {
    return UserModel(
      id: token['id'],
      username: token['username'],
      email: token['email'],
      firstName: token['firstName'],
      lastName: token['lastName'],
      gender: token['gender'],
      image: token['image'],
      iat: token['iat'],
      exp: token['exp'],
    );
  }
}
