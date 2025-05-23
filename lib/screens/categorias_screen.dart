import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/utils/ui_helpers.dart';
import 'package:nautik_app/modules/products/data/mock_menu_data.dart';
import 'package:nautik_app/screens/productos_screen.dart';
import 'package:nautik_app/themes/colors.dart';

class Categoriesview extends StatefulWidget {
  const Categoriesview({super.key});

  @override
  State<Categoriesview> createState() => _CategoriesviewState();
}

class _CategoriesviewState extends State<Categoriesview> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Ionicons.arrow_back_outline, color: Colors.white),
        ),
        title: Text('Categorías', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          children: [
            SearchBar(
              controller: _searchController,
              onChanged: (value) {
                setState(() {});
              },
              elevation: WidgetStatePropertyAll(3),
              backgroundColor: WidgetStatePropertyAll(searchbarColor),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              ),
              leading: Icon(Ionicons.search_outline),
              trailing:
                  _searchController.text.isEmpty
                      ? [SizedBox.shrink()]
                      : [
                        Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _searchController.clear();
                              });
                            },
                            icon: Icon(Ionicons.close_circle_outline, size: 30),
                          ),
                        ),
                      ],
              hintText: 'Buscar producto...',
            ),
            buildHeight(30),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: categoriesList.length,
                itemBuilder: (context, i) {
                  final category = categoriesList[i];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => Productsview(
                                products: category['products'],
                                categoryName: category['name'],
                              ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      clipBehavior:
                          Clip.antiAlias, // 👈 esto hace que el contenido (imagen) respete los bordes
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child:
                                category['image'], // Asegúrate de que la imagen se adapta
                          ),
                          Container(
                            height: 46.5,
                            color: primaryColor,
                            padding: EdgeInsets.all(5),
                            child: Center(
                              child: Text(
                                category['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
