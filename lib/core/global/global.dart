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

List<User> usersList = [
  User(
    email: 'melissa@mail.com',
    name: 'Melissa Mora',
    phone: '324 45667778',
    password: 'Colombia123',
  ),
  User(
    email: 'willinton@mail.com',
    name: 'Willinton Posso',
    phone: '324 63572023',
    password: 'admin123',
  ),
];

List<Map<String, dynamic>> menuList = [
  {
    'image': Image.asset('assets/dishes/001.jpg', fit: BoxFit.cover),
    'name': 'Pizza Margherita',
    'country': 'Italia',
    'rating': '4.8/5',
  },
  {
    'image': Image.asset('assets/dishes/002.jpg', fit: BoxFit.cover),
    'name': 'Tacos al Pastor',
    'country': 'México',
    'rating': '4.7/5',
  },
  {
    'image': Image.asset('assets/dishes/003.jpg', fit: BoxFit.cover),
    'name': 'Sushi',
    'country': 'Japón',
    'rating': '4.9/5',
  },
  {
    'image': Image.asset('assets/dishes/004.png', fit: BoxFit.cover),
    'name': 'Paella',
    'country': 'España',
    'rating': '4.6/5',
  },
  {
    'image': Image.asset('assets/dishes/005.jpg', fit: BoxFit.cover),
    'name': 'Croissant',
    'country': 'Francia',
    'rating': '4.5/5',
  },
  {
    'image': Image.asset('assets/dishes/006.jpg', fit: BoxFit.cover),
    'name': 'Pad Thai',
    'country': 'Tailandia',
    'rating': '4.7/5',
  },
];

List<Map<String, dynamic>> categoriesList = [
  {
    'image': Image.asset('assets/dishes/001.jpg', fit: BoxFit.cover),
    'name': 'Pizza Margherita',
    'products': menuList,
  },
  {
    'image': Image.asset('assets/dishes/002.jpg', fit: BoxFit.cover),
    'name': 'Tacos al Pastor',
    'products': menuList,
  },
  {
    'image': Image.asset('assets/dishes/003.jpg', fit: BoxFit.cover),
    'name': 'Sushi',
    'products': menuList,
  },
  {
    'image': Image.asset('assets/dishes/004.png', fit: BoxFit.cover),
    'name': 'Paella',
    'products': menuList,
  },
  {
    'image': Image.asset('assets/dishes/005.jpg', fit: BoxFit.cover),
    'name': 'Croissant',
    'products': menuList,
  },
  {
    'image': Image.asset('assets/dishes/006.jpg', fit: BoxFit.cover),
    'name': 'Pad Thai',
    'products': menuList,
  },
];

Widget nautik_logo() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Image.asset('assets/logo/nautik_logo.jpeg'),
  );
}

Widget nautik_banner() {
  return Image.asset(
    'assets/logo/nautik_baner.jpeg',
    fit: BoxFit.contain,
    width: double.infinity,
    height: 200,
  );
}

Color primaryColor = Color.fromARGB(255, 56, 224, 245);
Color backgroundColor = Colors.white;
double generalText = 18;
Color searchbarColor = Color.fromARGB(255, 240, 240, 240);

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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
