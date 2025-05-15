import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/utils/ui_helpers.dart';
import 'package:nautik_app/core/widgets/global_footer.dart';
import 'package:nautik_app/modules/auth/models/user_model.dart';
import 'package:nautik_app/providers/profile_provider.dart';
import 'package:nautik_app/themes/colors.dart';
import 'package:nautik_app/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DateTimeProvider>(context);
    return Scaffold(
      bottomNavigationBar: buildGlobalFooter(context),
      appBar: AppBar(
        title: Text('Mi Perfil'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Ionicons.arrow_back),
        ),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, i) {
            final user = usersList[i];
            return Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo/profile_picture.jpg',
                      fit: BoxFit.cover,
                      width: 190,
                      height: 190,
                    ),
                  ),
                ),
                buildHeight(10),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  label: Text(
                    'Editar imagen',
                    style: TextStyle(fontSize: generalText),
                  ),
                  icon: Icon(Ionicons.create_outline),
                  iconAlignment: IconAlignment.start,
                ),
                buildHeight(60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Nombre completo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: user.name,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: inputColor,
                    ),
                  ),
                ),
                buildHeight(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Correo electrónico',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Ionicons.lock_closed_outline),
                      hintText: user.email,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: inputColor,
                    ),
                  ),
                ),
                buildHeight(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Numero de telefono',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          '+57',
                          style: TextStyle(
                            fontSize: generalText,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      hintText: '324 6357218',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: inputColor,
                    ),
                  ),
                ),
                buildHeight(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Fecha de nacimiento',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextField(
                    onTap: () {
                      model.dateTimePicker(context);
                    },
                    controller: model.dateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Ionicons.calendar_number_outline),
                      hintText: 'Seleccionar fecha de nacimiento',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: inputColor,
                    ),
                  ),
                ),
                buildHeight(60),
                buildPrimaryButton(context, 'Actualizar', () {}),
              ],
            );
          },
        ),
      ),
    );
  }
}
