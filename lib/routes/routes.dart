import 'package:flutter/material.dart';
import 'package:nautik_app/screens/categorias_screen.dart';
import 'package:nautik_app/screens/home_screen.dart';
import 'package:nautik_app/screens/login_screen.dart';
import 'package:nautik_app/screens/registro_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/Login': (context) => Login(),
  '/Register': (context) => Register(),
  '/Home': (context) => Home(),
  '/Categories': (context) => Categoriesview(),
};
