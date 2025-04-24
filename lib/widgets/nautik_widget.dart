import 'package:flutter/material.dart';

Widget nautik_logo() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Image.asset('assets/logo/nautik_logo.png'),
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
