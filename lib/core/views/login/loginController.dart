// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:nautik_app/core/global/global.dart';
import 'package:nautik_app/core/views/login/viewModel.dart';

void Authentication(BuildContext context) {
  if (emailController.text == 'admin' &&
      passwordController.text == 'admin123') {
    triedAuth = 0;
    buildInfoDialog(
      context,
      'Inicio de sesión exitoso',
      '¡Bienvenido a Nautik App!',
    );
  } else {
    triedAuth++;

    if (triedAuth >= 2) {
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
