import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/global/global.dart';
import 'package:nautik_app/core/screens/carrito_screen/carrito_screen.dart';
import 'package:nautik_app/core/screens/login_screen/login_model.dart';

void buildModalBottomSheet(
  BuildContext context,
  List<Map<String, dynamic>> products,
  List<int> counters,
) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (x) {
      final selectedProducts = <Map<String, dynamic>>[];

      double subtotal = 0;
      const double domicilio = 6.99;
      const double ivaPorcentaje = 0.0101;

      bool noProducts = true;

      for (int i = 0; i < products.length; i++) {
        if (counters[i] > 0) {
          final product = products[i];
          final quantity = counters[i];

          selectedProducts.add({...product, 'quantity': quantity});

          double price = double.tryParse(product['price'].toString()) ?? 0;
          subtotal += price * quantity;

          noProducts = false;
        }
      }

      double iva = subtotal * ivaPorcentaje;
      double totalFinal = subtotal + domicilio + iva;

      return Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resumen de tu pedido',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child:
                  noProducts
                      ? Center(child: Text('No hay productos'))
                      : ListView.builder(
                        itemCount: selectedProducts.length,
                        itemBuilder: (context, index) {
                          final product = selectedProducts[index];
                          double price =
                              double.tryParse(product['price'].toString()) ?? 0;
                          int quantity = product['quantity'];
                          return ListTile(
                            leading: SizedBox(
                              height: 50,
                              width: 50,
                              child: product['image'],
                            ),
                            title: Text(product['name']),
                            subtitle: Text('Cantidad: $quantity'),
                            trailing: Text(
                              '\$${(price * quantity).toStringAsFixed(2)}',
                            ),
                          );
                        },
                      ),
            ),
            Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildResumenLinea('Subtotal:', subtotal),
                buildResumenLinea('Domicilio:', domicilio),
                buildResumenLinea('IVA (1.01%):', iva),
                Divider(),
                buildResumenLinea('Total a pagar:', totalFinal, isBold: true),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(300, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (x) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: Column(
                          children: [
                            Icon(
                              Ionicons.alert_circle_outline,
                              size: 60,
                              color: Color.fromARGB(255, 250, 120, 74),
                            ),
                            buildHeight(15),
                            Text(
                              '¿Confirmar tu pedido?',
                              style: TextStyle(
                                fontSize: generalText,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              '¿Estás seguro(a) de que deseas enviar tu pedido al carrito? Puedes confirmar ahora o seguir eligiendo más productos antes de finalizar.',
                            ),
                            buildHeight(20),
                          ],
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Cancelar',
                                  style: TextStyle(fontSize: generalText),
                                ),
                              ),
                              SizedBox(width: 20),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                  ); // Cierra el AlertDialog
                                  Navigator.pop(
                                    context,
                                  ); // Cierra el modal bottom sheet

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => Carritoview(
                                            productos: selectedProducts,
                                            subtotal: subtotal,
                                            domicilio: domicilio,
                                            iva: iva,
                                            totalFinal: totalFinal,
                                          ),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Aceptar',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: generalText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'Confirmar Pedido',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget buildResumenLinea(String label, double value, {bool isBold = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          '\$${value.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}
