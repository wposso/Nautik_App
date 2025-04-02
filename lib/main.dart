import 'package:flutter/material.dart';
import 'package:nautik_app/core/views/login/loginView.dart';

void main() {
  runApp(const NautikApp());
}

class NautikApp extends StatelessWidget {
  const NautikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login());
  }
}
