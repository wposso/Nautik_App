import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/global/global.dart';

class Productsview extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final String categoryName;
  const Productsview({
    super.key,
    required this.products,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(backgroundColor: primaryColor, title: Text(categoryName)),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, i) {
                  final product = products[i];
                  return SizedBox(
                    height: 100,
                    child: Column(
                      children: [
                        ListTile(
                          leading: SizedBox(
                            height: 90,
                            width: 90,
                            child: product['image'],
                          ),
                          title: Text(product['name'] ?? 'no name'),
                          subtitle: Text(product['rating']),
                          trailing: Icon(Ionicons.cart_outline),
                        ),
                        Divider(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
