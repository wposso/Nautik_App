import 'package:flutter/material.dart';
import 'package:nautik_app/core/screens/categorias_screen/categorias_screen.dart';
import 'package:nautik_app/core/screens/home_screen/home_screen.dart';
import 'package:nautik_app/core/screens/login_screen/login_screen.dart';
import 'package:nautik_app/core/screens/registro_screen/registro_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/Login': (context) => Login(),
  '/Register': (context) => Register(),
  '/Home': (context) => Home(),
  '/Categories': (context) => Categoriesview(),
};
