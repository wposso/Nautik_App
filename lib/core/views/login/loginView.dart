import 'package:flutter/material.dart';
import 'package:nautik_app/core/global/global.dart';
import 'package:nautik_app/core/views/login/loginController.dart';
import 'package:nautik_app/core/views/login/viewModel.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                        prefixIcon: Icon(Icons.person_outline_sharp, size: 30),
                        hintText: 'Correo electrónico',
                        hintStyle: TextStyle(fontSize: generalText),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    buildHeight(30),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_rounded, size: 35),
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(250, 60),
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Authentication(context);
                      },
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
                buildWidth(15),
                Text(
                  'Registrarse',
                  style: TextStyle(fontSize: generalText, color: primaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
