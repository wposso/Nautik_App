import 'package:flutter/material.dart';
import 'package:nautik_app/core/global/global.dart';
import 'package:nautik_app/core/views/registerView/viewModel.dart';

void registerUser(BuildContext context) {
  if (emailControllerVR.text.isEmpty ||
      nameControllerVR.text.isEmpty ||
      phoneControllerVR.text.isEmpty ||
      passwordControllerVR.text.isEmpty) {
    buildInfoDialog(
      context,
      'Registro fallido',
      'Recuerda ingresar los datos \ncorrectamente',
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
    );
  }
  emailControllerVR.clear();
  nameControllerVR.clear();
  phoneControllerVR.clear();
  passwordControllerVR.clear();
}
