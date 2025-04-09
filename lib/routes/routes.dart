import 'package:flutter/material.dart';
import 'package:nautik_app/core/views/categoriesView/categoriesView.dart';
import 'package:nautik_app/core/views/homeView/homeView.dart';
import 'package:nautik_app/core/views/loginView/loginView.dart';
import 'package:nautik_app/core/views/registerView/registerView.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/Login': (context) => Login(),
  '/Register': (context) => Register(),
  '/Home': (context) => Home(),
  '/Categories': (context) => Categoriesview(),
};
