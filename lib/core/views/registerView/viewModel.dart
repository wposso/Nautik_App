import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

Widget buildTextField(
  BuildContext context,
  String text,
  IconData icon,
  TextEditingController controller,
) {
  return TextField(
    obscureText: text == 'Contraseña' ? true : false,
    controller: controller,
    decoration: InputDecoration(
      prefixIcon: Icon(icon, size: 30),
      hintText: text,
      border: UnderlineInputBorder(),
    ),
  );
}

var emailControllerVR = TextEditingController();
var nameControllerVR = TextEditingController();
var phoneControllerVR = TextEditingController();
var passwordControllerVR = TextEditingController();
