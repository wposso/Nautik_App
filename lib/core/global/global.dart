// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User {
  String email;
  String name;
  String phone;
  String password;

  User({
    required this.email,
    required this.name,
    required this.phone,
    required this.password,
  });
}

List<User> usersList = [];

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
    // fit: BoxFit.cover,
    height: 50,
    width: 70,
  );
}

Color primaryColor = Color.fromARGB(255, 56, 224, 245);
Color backgroundColor = Colors.white;
double generalText = 18;

bool changePassword = false;
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
              changePassword
                  ? Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancelar',
                          style: TextStyle(fontSize: generalText),
                        ),
                      ),
                      SizedBox(width: 20),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Aceptar',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: generalText,
                          ),
                        ),
                      ),
                    ],
                  )
                  : TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Aceptar',
                      style: TextStyle(
                        fontSize: generalText,
                        color: primaryColor,
                      ),
                    ),
                  ),
            ],
          ),
        ],
      );
    },
  );
}

Widget buildDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: backgroundColor,
    child: Column(
      children: [
        DrawerHeader(child: Column(children: [nautik_logo()])),
      ],
    ),
  );
}

Widget buildPrimaryButton(BuildContext context, String text, Function onTap) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: Size(300, 60),
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onPressed: () => onTap(),
    child: Text(
      text,
      style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
    ),
  );
}
