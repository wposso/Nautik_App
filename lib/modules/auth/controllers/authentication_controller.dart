// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/global/global.dart';
import 'package:nautik_app/modules/auth/models/user_model.dart';
import 'package:nautik_app/widgets/dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool onOff = false;
  int triedAuth = 0;
  bool changePassword = false;
  bool obscurePassword = true;

  void toggleObscurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void authenticate(BuildContext context) {
    final emailEntered = emailController.text.trim();
    final passwordEntered = passwordController.text.trim();

    passwordController.addListener(() {
      notifyListeners();
    });

    if (emailEntered.isEmpty || passwordEntered.isEmpty) {
      buildInfoDialog(
        context,
        'Campos Faltantes',
        'Por favor ingresa tu correo y contraseña.',
        Ionicons.alert_circle_outline,
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
          Ionicons.checkmark_circle_outline,
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
          '¿Deseas reestablecer tu contraseña por correo?',
          Ionicons.close_circle_outline,
        );
      } else {
        buildInfoDialog(
          context,
          'Datos incorrectos',
          'Contraseña o usuario inválido. Vuelve a intentarlo',
          Ionicons.close_circle_outline,
        );
      }
    }

    emailController.clear();
    passwordController.clear();
    notifyListeners();
  }

  Future<void> loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email');
    final savedPassword = prefs.getString('password');
    final remember = prefs.getBool('rememberMe') ?? false;

    onOff = remember;

    if (onOff) {
      if (savedEmail != null) emailController.text = savedEmail;
      if (savedPassword != null) passwordController.text = savedPassword;
    }

    notifyListeners();
  }
}
