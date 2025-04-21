import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/global/global.dart';
import 'package:nautik_app/core/screens/login_screen/login_model.dart';
import 'package:nautik_app/core/screens/registro_screen/registro_controller.dart';
import 'package:nautik_app/core/screens/registro_screen/registro_model.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 38),
        child: Column(
          children: [
            SizedBox(width: 250, child: nautik_logo()),

            buildHeight(60),
            buildTextField(
              context,
              'Correo electrónico',
              Ionicons.mail_outline,
              emailControllerVR,
              () {},
            ),
            buildHeight(20),
            buildTextField(
              context,
              'Nombre completo',
              Ionicons.person_outline,
              nameControllerVR,
              () {},
            ),
            buildHeight(20),
            buildTextField(
              context,
              'Número de telefono',
              Ionicons.call_outline,
              phoneControllerVR,
              () {},
            ),
            buildHeight(20),
            buildTextField(
              context,
              'Contraseña',
              Ionicons.lock_closed_outline,
              passwordControllerVR,
              () {
                setState(() {});
              },
            ),
            buildHeight(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  activeColor: primaryColor,
                  value: isChecked,
                  onChanged: (x) {
                    setState(() {
                      privacyPolicy(context, () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                        Navigator.pop(context);
                      });
                    });
                  },
                ),
                Text(
                  'Acepto Términos y Condiciones',
                  style: TextStyle(fontSize: generalText),
                ),
              ],
            ),
            buildHeight(80),
            buildPrimaryButton(context, 'Registrarme', () {
              setState(() {
                registerUser(context);
              });
            }),
            buildHeight(20),
            Row(
              children: [
                Text(
                  '¿Ya tienes una cuenta? ',
                  style: TextStyle(fontSize: generalText),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/Login');
                  },
                  child: Text(
                    'Iniciar sesión',
                    style: TextStyle(
                      fontSize: generalText,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            // buildHeight(40),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Icon(Ionicons.logo_facebook, size: 50),
            //     buildWidth(40),
            //     Icon(Ionicons.logo_twitter, size: 50),
            //     buildWidth(40),
            //     Icon(Ionicons.logo_instagram, size: 50),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
