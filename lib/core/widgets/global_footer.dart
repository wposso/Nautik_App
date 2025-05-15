import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

Widget buildGlobalFooter(BuildContext context) {
  return NavigationBar(
    destinations: [
      NavigationDestination(icon: Icon(Ionicons.home_outline), label: 'Home'),
      NavigationDestination(
        icon: Icon(Ionicons.grid_outline),
        label: 'Categorías',
      ),
      NavigationDestination(
        icon: Icon(Ionicons.person_outline),
        label: 'Perfil',
      ),
      NavigationDestination(
        icon: Icon(Ionicons.hammer_outline),
        label: 'Configuración',
      ),
    ],
  );
}
