import 'package:flutter/material.dart';
import 'package:nautik_app/modules/auth/controllers/authentication_controller.dart';
import 'package:nautik_app/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationController()),
      ],
      child: const NautikApp(),
    ),
  );
}

class NautikApp extends StatelessWidget {
  const NautikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: '/Login',
      routes: routes,
      builder: (context, child) {
        return Banner(
          message: 'Staging',
          location: BannerLocation.topEnd,
          color: Color(0xA0B71C1C),
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
            letterSpacing: 1.0,
            color: Colors.white,
          ),
          child: child!,
        );
      },
    );
  }
}
