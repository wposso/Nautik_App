import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/global/global.dart';

bool isPasswordVisible = false;

Widget buildTextField(
  BuildContext context,
  String text,
  IconData icon,
  TextEditingController controller,
  Function onTap,
) {
  final isPasswordField = text == 'Contraseña';

  return TextField(
    onChanged: (x) {
      onTap();
    },
    obscureText: isPasswordField ? !isPasswordVisible : false,
    controller: controller,
    decoration: InputDecoration(
      suffixIcon:
          isPasswordField && controller.text.isNotEmpty
              ? IconButton(
                onPressed: () {
                  isPasswordVisible = !isPasswordVisible;
                  onTap();
                },
                icon: Icon(
                  isPasswordVisible
                      ? Ionicons.eye_off_outline
                      : Ionicons.eye_outline,
                  size: 30,
                ),
              )
              : null,
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

bool isChecked = false;

void privacyPolicy(BuildContext context, Function onTap) {
  showDialog(
    context: context,
    builder: (builder) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'Política de privacidad',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: Text(
          'Esta aplicación recopila información mínima necesaria para ofrecer un mejor servicio. '
          'Podemos almacenar datos como tu nombre, correo electrónico y estadísticas de uso dentro de la app. '
          '\n\nEstos datos se utilizan exclusivamente para mejorar el rendimiento, personalizar funciones '
          'y mantener la seguridad de tu cuenta. No compartimos tu información con terceros, a menos que sea requerido '
          'por ley o con tu consentimiento explícito. \n\nImplementamos medidas de seguridad para proteger tus datos '
          'contra accesos no autorizados. Al usar esta aplicación, aceptas esta política de privacidad y el uso responsable '
          'de tu información. \n\nPara más detalles o solicitudes relacionadas con tus datos, puedes comunicarte con nosotros '
          'a través del correo de soporte que encontrarás en el menú de ayuda.',
          style: TextStyle(fontSize: 17),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'He leído y acepto',
                style: TextStyle(fontSize: generalText),
              ),
              Checkbox(
                value: false,
                onChanged: (x) {
                  onTap();
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
