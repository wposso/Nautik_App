// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:nautik_app/core/global/global.dart';
import 'package:nautik_app/core/views/loginView/viewModel.dart';
import 'package:nautik_app/core/views/registerView/viewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

void Authentication(BuildContext context) {
  String emailEntered = emailController.text.trim();
  String passwordEntered = passwordController.text.trim();

  if (emailEntered.isEmpty || passwordEntered.isEmpty) {
    buildInfoDialog(
      context,
      'Campos Faltantes',
      'Por favor ingresa tu correo y \ncontraseña.',
    );
    return;
  }

  bool isAuthenticated = false;
  for (var user in usersList) {
    if (user.email == emailEntered && user.password == passwordEntered) {
      isAuthenticated = true;
      buildInfoDialog(
        context,
        'Inicio de sesión exitoso',
        '¡Bienvenido a Nautik App!',
      );
      triedAuth = 0;
      Navigator.pushReplacementNamed(context, '/Home');
      break;
    }
  }

  if (!isAuthenticated) {
    triedAuth++;

    if (triedAuth >= 2) {
      changePassword = true;
      buildInfoDialog(
        context,
        'Datos incorrectos',
        'Los datos que ingresaste son \nincorrectos. ¿Deseas \nreestablecer tu contraseña \npor medio del correo \nelectrónico?',
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

void loadSavedCredentials() async {
  final prefs = await SharedPreferences.getInstance();
  final savedEmail = prefs.getString('email');
  final savedPassword = prefs.getString('password');
  final remember = prefs.getBool('rememberMe') ?? false;

  onOff = remember; // usar la variable global

  if (onOff) {
    if (savedEmail != null) emailController.text = savedEmail;
    if (savedPassword != null) passwordController.text = savedPassword;
  }
}
