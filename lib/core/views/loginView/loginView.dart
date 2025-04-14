import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/global/global.dart';
import 'package:nautik_app/core/views/loginView/loginController.dart';
import 'package:nautik_app/core/views/loginView/viewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isActive = true;

  void initState() {
    super.initState();
    loadSavedCredentials();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SizedBox(width: 250, child: nautik_logo())],
            ),
            buildHeight(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  '¡Bienvenido de nuevo! Por favor inicia \nsesión para continuar.',
                  style: TextStyle(fontSize: generalText),
                ),
              ],
            ),
            buildHeight(30),
            Form(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      autofocus: true,
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Ionicons.mail_outline, size: 30),
                        hintText: 'Correo electrónico',
                        hintStyle: TextStyle(fontSize: generalText),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    buildHeight(30),
                    TextField(
                      onChanged: (x) {
                        setState(() {});
                      },
                      controller: passwordController,
                      obscureText: isActive,
                      decoration: InputDecoration(
                        suffixIcon:
                            passwordController.text.isEmpty
                                ? SizedBox.shrink()
                                : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isActive = !isActive;
                                    });
                                  },
                                  icon: Icon(
                                    isActive
                                        ? Ionicons.eye_outline
                                        : Ionicons.eye_off_outline,
                                    size: 30,
                                  ),
                                ),
                        prefixIcon: Icon(
                          Ionicons.lock_closed_outline,
                          size: 35,
                        ),
                        hintText: 'Contraseña',
                        hintStyle: TextStyle(fontSize: generalText),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    buildHeight(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Recordarme',
                          style: TextStyle(fontSize: generalText),
                        ),
                        buildWidth(10),
                        Switch(
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                          value: onOff,
                          onChanged: (x) async {
                            final prefs = await SharedPreferences.getInstance();

                            setState(() {
                              onOff = x;
                            });

                            if (onOff) {
                              // Guarda solo si hay contenido
                              if (emailController.text.isNotEmpty) {
                                prefs.setString('email', emailController.text);
                              }
                              if (passwordController.text.isNotEmpty) {
                                prefs.setString(
                                  'password',
                                  passwordController.text,
                                );
                              }
                              prefs.setBool('rememberMe', true);
                            } else {
                              // Limpia todo si desactiva
                              prefs.remove('email');
                              prefs.remove('password');
                              prefs.setBool('rememberMe', false);
                            }
                          },
                        ),
                      ],
                    ),
                    buildHeight(80),
                    buildPrimaryButton(context, 'Iniciar sesión', () {
                      Authentication(context);
                    }),
                  ],
                ),
              ),
            ),
            buildHeight(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¿Aún no tienes cuenta?',
                  style: TextStyle(fontSize: generalText),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/Register');
                  },
                  child: Text(
                    'Registrarse',
                    style: TextStyle(
                      fontSize: generalText,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
