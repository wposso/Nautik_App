// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:nautik_app/core/global/global.dart';
import 'package:nautik_app/core/views/loginView/viewModel.dart';
import 'package:nautik_app/core/views/registerView/viewModel.dart';

void Authentication(BuildContext context) {
  String emailEntered = emailController.text.trim();
  String passwordEntered = passwordController.text.trim();

  for (var user in usersList) {
    if (user.email == emailEntered && user.password == passwordEntered) {
      buildInfoDialog(
        context,
        'Inicio de sesión exitoso',
        '¡Bienvenido a Nautik App!',
      );
      triedAuth = 0;
      Navigator.pushReplacementNamed(context, '/Home');
      return;
    } else {
      triedAuth++;

      if (triedAuth >= 2) {
        changePassword = true;
        buildInfoDialog(
          context,
          'Datos incorrectos',
          'Los datos que ingresaste son \nincorrectos. ¿Desea \nreestablecer su contraseña \npor medio del correo \nelectrónico?',
        );
      } else {
        buildInfoDialog(
          context,
          'Datos incorrectos',
          'Contraseña o usuario inválido. \nVuelve a intentarlo',
        );
      }
    }
    emailController.clear();
    passwordController.clear();
  }
}
