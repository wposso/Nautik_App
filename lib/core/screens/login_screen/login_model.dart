import 'package:flutter/material.dart';

Widget buildHeight(double size) {
  return SizedBox(height: size);
}

Widget buildWidth(double size) {
  return SizedBox(width: size);
}

bool onOff = false;
int triedAuth = 0;

var emailController = TextEditingController();
var passwordController = TextEditingController();

