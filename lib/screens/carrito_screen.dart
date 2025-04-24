import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/global/global.dart';
import 'package:nautik_app/core/utils/ui_helpers.dart';
import 'package:nautik_app/screens/mapa_screen.dart';
import 'package:nautik_app/themes/colors.dart';
import 'package:nautik_app/widgets/custom_widgets.dart';

class Carritoview extends StatelessWidget {
  final List<Map<String, dynamic>> productos;
  final double subtotal;
  final double domicilio;
  final double iva;
  final double totalFinal;

  const Carritoview({
    super.key,
    required this.productos,
    required this.subtotal,
    required this.domicilio,
    required this.iva,
    required this.totalFinal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Tu carrito'),
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapaLibreView()),
                );
              },
              leading: Icon(Ionicons.location_outline, size: 30),
              title: Text('Dirección de entrega'),
              trailing: Icon(Ionicons.chevron_forward_outline),
            ),
            Divider(),
            ListTile(
              leading: Icon(Ionicons.alarm_outline, size: 30),
              title: Text('40 - 50 min'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Ionicons.journal_outline, size: 30),
              title: Text('Metodo de pago'),
              trailing: Icon(Ionicons.chevron_forward_outline),
            ),
            Divider(),
            buildHeight(30),
            Text(
              'Detalle de tu compra:',
              style: TextStyle(fontSize: generalText),
            ),
            buildHeight(15),
            Expanded(
              child: ListView.builder(
                itemCount: productos.length,
                itemBuilder: (context, index) {
                  final p = productos[index];
                  return ListTile(
                    leading: p['image'],
                    title: Text(p['name']),
                    subtitle: Text('Cantidad: ${p['quantity']}'),
                    trailing: Text(
                      '\$${(p['price'] * p['quantity']).toStringAsFixed(2)}',
                    ),
                  );
                },
              ),
            ),
            Divider(),
            buildResumenLinea('Subtotal:', subtotal),
            buildResumenLinea('Domicilio:', domicilio),
            buildResumenLinea('IVA:', iva),
            Divider(),
            buildResumenLinea('Total:', totalFinal, isBold: true),

            Spacer(),
            buildPrimaryButton(context, 'Pagar', () {}),
          ],
        ),
      ),
    );
  }
}

Widget buildResumenLinea(String label, double value, {bool isBold = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: isBold ? FontWeight.bold : null),
        ),
        Text(
          '\$${value.toStringAsFixed(2)}',
          style: TextStyle(fontWeight: isBold ? FontWeight.bold : null),
        ),
      ],
    ),
  );
}
