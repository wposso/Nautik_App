import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/screens/home_screen/home_controller.dart';
import 'package:nautik_app/core/screens/login_screen/login_model.dart';

class GlobalDrawer extends StatelessWidget {
  const GlobalDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildListile(
      BuildContext context,
      IconData icon,
      String text,
      Function onTap,
    ) {
      return ListTile(
        leading: Icon(icon),
        title: Text(text),
        trailing: Icon(Ionicons.chevron_forward_outline),
        onTap: () => onTap(),
      );
    }

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Image.asset(
              'assets/dishes/001.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 400,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildListile(
                  context,
                  Ionicons.fish_outline,
                  'Pide en línea',
                  () {
                    Navigator.pushNamed(context, '/Categories');
                  },
                ),
                buildListile(
                  context,
                  Ionicons.create_outline,
                  'Mis pedidos',
                  () {},
                ),
                buildListile(
                  context,
                  Ionicons.person_outline,
                  'Mi perfil',
                  () {},
                ),
                buildListile(
                  context,
                  Ionicons.lock_closed_outline,
                  'Actualizar contraseña',
                  () {},
                ),
                buildListile(
                  context,
                  Ionicons.exit_outline,
                  'Cerrar sesión',
                  () {
                    logoutUser(context);
                  },
                ),
              ],
            ),
          ),
          Spacer(),
          Divider(),
          Column(
            children: [
              Text('Nuestras redes sociales'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Ionicons.logo_facebook, size: 40),
                        buildWidth(40),
                        Icon(Ionicons.logo_twitter, size: 40),
                        buildWidth(40),
                        Icon(Ionicons.logo_instagram, size: 40),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
