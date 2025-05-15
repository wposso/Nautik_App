import 'package:flutter/material.dart';

class User {
  String email;
  String name;
  String phone;
  String password;

  User({
    required this.email,
    required this.name,
    required this.phone,
    required this.password,
  });
}

List<User> usersList = [
  User(
    email: 'melissa@mail.com',
    name: 'Melissa Mora',
    phone: '324 45667778',
    password: 'Colombia123',
  ),
  User(
    email: 'willinton@mail.com',
    name: 'Willinton Posso',
    phone: '324 63572023',
    password: 'admin123',
  ),
];

String getUserName(String email) {
  return usersList
      .firstWhere(
        (user) => user.email == email,
        orElse:
            () => User(email: 'Invitado', name: '', phone: '', password: ''),
      )
      .name;
}
