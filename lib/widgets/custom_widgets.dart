// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/utils/ui_helpers.dart';
import 'package:nautik_app/modules/products/data/mock_menu_data.dart';
import 'package:nautik_app/themes/colors.dart';

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
                  'Bienvenido a nuestra aplicación,\n ahora podrás disfrutar de la\n mejor comida',
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

void logoutUser(BuildContext context) {
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
              'Cerrar sesión',
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
                  'Esta seguro que desea cerrar \nsesion?',
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
              Row(
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
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/Login');
                    },
                    child: Text(
                      'Aceptar',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: generalText,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    },
  );
}

Widget buildPrimaryButton(BuildContext context, String text, Function onTap) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: Size(300, 55),
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onPressed: () => onTap(),
    child: Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}
