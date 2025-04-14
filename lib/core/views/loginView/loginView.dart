import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/global/global.dart';
import 'package:nautik_app/core/views/loginView/loginController.dart';
import 'package:nautik_app/core/views/loginView/viewModel.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isActive = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 260,
                  width: 280,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: nautik_logo(),
                  ),
                ),
              ],
            ),
            buildHeight(50),
            Form(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
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
                          onChanged: (x) {
                            setState(() {
                              onOff = !onOff;
                            });
                          },
                        ),
                      ],
                    ),
                    buildHeight(60),
                    buildPrimaryButton(context, 'Iniciar sesión', () {
                      Authentication(context);
                    }),
                  ],
                ),
              ),
            ),
            buildHeight(70),
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
