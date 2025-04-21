// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/global/global.dart';
import 'package:nautik_app/core/screens/login_screen/login_model.dart';

void welcomeUser(BuildContext context) {
  showDialog(
    context: context,
    builder: (x) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Column(
          children: [
            Icon(
              Ionicons.checkmark_circle_outline,
              size: 60,
              color: Color.fromARGB(255, 3, 194, 125),
            ),
            buildHeight(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Inicio de sesión exitoso',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
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
                  'Bienvenido a nuestra aplicación \nahora podrás disfrutar de la mejor \ncomida',
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
}

void buildDialogOnline(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 8),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Sabores frescos del mar, cortes selectos \ny mucho más… ¡una experiencia única en \ncada plato!',
                  style: TextStyle(fontSize: generalText),
                ),
              ],
            ),
            buildHeight(15),
            SizedBox(
              height: 200,
              width: 350,
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: menuList.length,
                  itemBuilder: (context, i) {
                    return Card(
                      elevation: 3,
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: menuList[i]['image'],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildPrimaryButton(context, 'Domicilio', () {
                  Navigator.pushReplacementNamed(context, '/Categories');
                }),
              ],
            ),
          ),
        ],
      );
    },
  );
}
