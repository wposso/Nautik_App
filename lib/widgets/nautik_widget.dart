import 'package:flutter/material.dart';

Widget nautik_logo() {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(100),
      topRight: Radius.circular(100),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset('assets/logo/nautik_logo.png'),
    ),
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
