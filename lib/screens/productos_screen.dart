import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/data/models/product_model.dart';
import 'package:nautik_app/themes/colors.dart';
import 'package:nautik_app/widgets/custom_widgets.dart';

class Productsview extends StatefulWidget {
  final List<Map<String, dynamic>> products;
  final String categoryName;
  const Productsview({
    super.key,
    required this.products,
    required this.categoryName,
  });

  @override
  State<Productsview> createState() => _ProductsviewState();
}

class _ProductsviewState extends State<Productsview> {
  int counterIndicator = 0;
  late List<int> counters;

  @override
  void initState() {
    super.initState();
    counters = List.filled(widget.products.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(widget.categoryName),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: widget.products.length,
                itemBuilder: (context, i) {
                  final product = widget.products[i];
                  return SizedBox(
                    height: 100,
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: SizedBox(
                            height: 90,
                            width: 90,
                            child: product['image'],
                          ),
                          title: Text(product['name'] ?? 'no name'),
                          subtitle: Text(product['price'].toString()),
                          trailing: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (counters[i] > 0) counters[i]--;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Icon(
                                      Ionicons.remove_outline,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  counters[i].toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      counters[i]++;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Icon(Ionicons.add_outline, size: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  );
                },
              ),
            ),
            buildPrimaryButton(context, 'Detalle', () {
              buildModalBottomSheet(context, widget.products, counters);
            }),
          ],
        ),
      ),
    );
  }
}
