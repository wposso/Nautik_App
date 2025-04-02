// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget nautik_logo() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Image.asset(
      'assets/nautik_logo.jpeg',
      fit: BoxFit.cover,
      // height: 100,
      // width: 100,
    ),
  );
}

Widget nautik_banner() {
  return Image.asset(
    'assets/nautik_baner.jpeg',
    fit: BoxFit.cover,
    height: 70,
    width: 70,
  );
}

Color primaryColor = Color.fromARGB(255, 56, 224, 245);
double generalText = 19;

void buildInfoDialog(BuildContext context, String tittle, String message) {
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
              tittle,
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
                  message,
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
                  style: TextStyle(fontSize: generalText, color: primaryColor),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
