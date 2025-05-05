import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/utils/ui_helpers.dart';
import 'package:nautik_app/themes/colors.dart';

bool changePassword = false;

void buildInfoDialog(
  BuildContext context,
  String tittle,
  String message,
  IconData? icon,
) {
  showDialog(
    context: context,
    builder: (x) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Column(
          children: [
            Icon(
              icon,
              size: 60,
              color:
                  icon == Ionicons.checkmark_circle_outline
                      ? Color.fromARGB(255, 3, 194, 125)
                      : Color.fromARGB(255, 254, 67, 69),
            ),
            buildHeight(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  tittle,
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
