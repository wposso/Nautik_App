// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/global/global.dart';
import 'package:nautik_app/core/views/loginView/viewModel.dart';

void welcomeUser(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (x) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'Inicio de sesión exitoso',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Bienvenido a Nautik, ahora puedes\n disfrutar de la mejor comida',
                  style: TextStyle(fontSize: generalText),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Aceptar',
                  style: TextStyle(color: primaryColor, fontSize: generalText),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );

  // Timer(Duration(seconds: 4), () {
  //   Navigator.pop(context);
  // });
}

void buildDialogOnline(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        titlePadding: EdgeInsets.zero,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Ionicons.close_outline),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Disfruta de la mejor comida de\n mar que tenemos para tí',
              style: TextStyle(fontSize: 17),
            ),
            buildHeight(15),
            Image.asset('assets/dishes/006.jpg', fit: BoxFit.cover),
          ],
        ),
        actionsPadding: EdgeInsets.zero,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/Categories');
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Center(
                  child: Text(
                    'Domicilio',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: generalText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
