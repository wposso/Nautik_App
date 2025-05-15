import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/utils/ui_helpers.dart';
import 'package:nautik_app/modules/auth/controllers/authentication_controller.dart';
import 'package:nautik_app/themes/colors.dart';
import 'package:nautik_app/widgets/custom_widgets.dart';
import 'package:nautik_app/widgets/nautik_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isActive = true;

  void initState() {
    super.initState();
    Future.microtask(() {
      final model =
          Provider.of<AuthenticationController>(
            context,
            listen: false,
          ).loadSavedCredentials();
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AuthenticationController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SizedBox(width: 250, child: nautik_logo())],
            ),
            buildHeight(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  '¡Bienvenido de nuevo! Por favor inicia \nsesión para continuar.',
                  style: TextStyle(fontSize: generalText),
                ),
              ],
            ),
            buildHeight(30),
            Form(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextField(
                        autofocus: true,
                        controller: model.emailController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 10,
                          ),
                          prefixIcon: Icon(Ionicons.mail_outline, size: 30),
                          hintText: 'Correo electrónico',
                          hintStyle: TextStyle(fontSize: generalText),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          filled: true,
                          fillColor: inputColor,
                        ),
                      ),
                    ),
                    buildHeight(20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextField(
                        controller: model.passwordController,
                        obscureText: model.obscurePassword,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 10,
                          ),
                          prefixIcon: Icon(
                            Ionicons.lock_closed_outline,
                            size: 35,
                          ),
                          hintText: 'Contraseña',
                          hintStyle: TextStyle(fontSize: generalText),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          filled: true,
                          fillColor: inputColor,
                          suffixIcon:
                              model.passwordController.text.isEmpty
                                  ? SizedBox.shrink()
                                  : IconButton(
                                    onPressed: () {
                                      model.toggleObscurePassword();
                                    },
                                    icon: Icon(
                                      model.obscurePassword
                                          ? Ionicons.eye_outline
                                          : Ionicons.eye_off_outline,
                                      size: 30,
                                    ),
                                  ),
                        ),
                      ),
                    ),

                    buildHeight(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Recordarme',
                          style: TextStyle(fontSize: generalText),
                        ),
                        buildWidth(10),
                        Switch(
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                          value: model.onOff,
                          onChanged: (x) async {
                            final prefs = await SharedPreferences.getInstance();

                            model.onOff = x;

                            if (x) {
                              if (model.emailController.text.isNotEmpty) {
                                prefs.setString(
                                  'email',
                                  model.emailController.text,
                                );
                              }
                              if (model.passwordController.text.isNotEmpty) {
                                prefs.setString(
                                  'password',
                                  model.passwordController.text,
                                );
                              }
                              prefs.setBool('rememberMe', true);
                            } else {
                              prefs.remove('email');
                              prefs.remove('password');
                              prefs.setBool('rememberMe', false);
                            }

                            model.notifyListeners();
                          },
                        ),
                      ],
                    ),
                    buildHeight(80),
                    buildPrimaryButton(context, 'Iniciar sesión', () {
                      model.authenticate(context);
                    }),
                  ],
                ),
              ),
            ),
            buildHeight(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¿Aún no tienes cuenta?',
                  style: TextStyle(fontSize: generalText),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/Register');
                  },
                  child: Text(
                    'Registrarse',
                    style: TextStyle(
                      fontSize: generalText,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
