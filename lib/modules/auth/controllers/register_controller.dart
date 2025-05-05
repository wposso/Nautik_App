import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/global/global.dart';
import 'package:nautik_app/modules/auth/models/user_model.dart';
import 'package:nautik_app/modules/auth/widgets/form_widget.dart';
import 'package:nautik_app/widgets/dialogs.dart';

void registerUser(BuildContext context) {
  if (emailControllerVR.text.isEmpty ||
      nameControllerVR.text.isEmpty ||
      phoneControllerVR.text.isEmpty ||
      passwordControllerVR.text.isEmpty) {
    buildInfoDialog(
      context,
      'Registro fallido',
      'Recuerda ingresar los datos \ncorrectamente',
      Ionicons.close_circle_outline,
    );
  } else if (isChecked == false) {
    buildInfoDialog(
      context,
      'Registro fallido',
      'Debes aceptar la política\n de privacidad',
      Ionicons.close_circle_outline,
    );
  } else {
    usersList.add(
      User(
        email: emailControllerVR.text,
        name: nameControllerVR.text,
        phone: phoneControllerVR.text,
        password: passwordControllerVR.text,
      ),
    );
    buildInfoDialog(
      context,
      'Registro exitoso',
      'Ahora puedes disfrutar de la \nmejor comida de mar',
      Ionicons.checkmark_circle_outline,
    );
  }
  emailControllerVR.clear();
  nameControllerVR.clear();
  phoneControllerVR.clear();
  passwordControllerVR.clear();
  isChecked = false;
}
