import 'package:flutter/material.dart';
import 'package:nautik_app/core/views/homeView/homeView.dart';
import 'package:nautik_app/core/views/loginView/loginView.dart';
import 'package:nautik_app/core/views/registerView/registerView.dart';
import 'package:nautik_app/routes/routes.dart';

void main() {
  runApp(const NautikApp());
}

class NautikApp extends StatelessWidget {
  const NautikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/Login',
      routes: routes,
    );
  }
}
