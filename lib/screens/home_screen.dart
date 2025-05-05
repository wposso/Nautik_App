// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/utils/ui_helpers.dart';
import 'package:nautik_app/core/widgets/global_drawer.dart';
import 'package:nautik_app/modules/products/data/mock_menu_data.dart';
import 'package:nautik_app/themes/colors.dart';
import 'package:nautik_app/widgets/custom_widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      welcomeUser(context);
    });

    _pageController.addListener(() {
      setState(() {
        currentIndex = _pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() { 
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GlobalDrawer(),
      key: _scaffoldKey,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Ionicons.menu, size: 40, color: primaryColor),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        iconTheme: IconThemeData(color: primaryColor),
        backgroundColor: Colors.white,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bienvenido/a', style: TextStyle(fontSize: 13)),
            Text(
              'Melissa Mora G.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        actionsPadding: EdgeInsets.only(right: 20),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Icon(Ionicons.cart_outline),
                ),
              ),
              buildWidth(10),
              CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/logo/profile_picture.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            buildHeight(20),
            SearchBar(
              elevation: WidgetStatePropertyAll(0),
              backgroundColor: WidgetStatePropertyAll(searchbarColor),
              leading: Icon(Ionicons.search_outline),
              hintText: 'Buscar platos y categorias',
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: PageView.builder(
                itemCount: menuList.length,
                itemBuilder: (itemBuilder, i) {
                  final item = menuList[i];
                  return Stack(
                    children: [
                      Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: item['image'],
                        ),
                      ),
                      Positioned(
                        bottom: 25,
                        left: 25,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor: Colors.deepOrange,
                            foregroundColor: Colors.white,
                            fixedSize: Size(150, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                          ),
                          label: Text(
                            'Comprar',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          iconAlignment: IconAlignment.end,
                          icon: Icon(
                            Ionicons.chevron_forward_circle_sharp,
                            size: 25,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 25,
                        right: 30,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Somos tienda',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                buildWidth(5),
                                Text(
                                  'en linea',
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text('haz tu pedido ahora',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            buildHeight(20),
            Row(
              children: [
                Text(
                  'Categorías',
                  style: TextStyle(
                    fontSize: generalText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text('Ver todo', style: TextStyle(fontSize: generalText)),
              ],
            ),
            buildHeight(10),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: menuList.length,
                itemBuilder: (itemBuilder, i) {
                  return Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        padding: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: menuList[i]['image'],
                        ),
                      ),
                      Text(menuList[i]['name'].split(' ')[0]),
                    ],
                  );
                },
              ),
            ),
            buildHeight(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    fixedSize: Size(160, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Pedir ahora',
                    style: TextStyle(
                      fontSize: generalText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                buildWidth(20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    fixedSize: Size(160, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Mis pedidos',
                    style: TextStyle(
                      fontSize: generalText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // buildPrimaryButton(context, 'Pedir ahora', () {}),
                // buildWidth(20),
                // buildPrimaryButton(context, 'Mis pedidos', () {}),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Platos Populares',
            //         style: TextStyle(
            //           fontSize: 24,
            //           fontWeight: FontWeight.bold,
            //           color: primaryColor,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Text(
            //       'Explora los platos más populares de \ndistintas partes del mundo. Descubre \nsabores únicos y califica tus favoritos.',
            //       style: TextStyle(
            //         fontSize: generalText,
            //         color: Colors.grey[700],
            //         fontWeight: FontWeight.normal,
            //       ),
            //       textAlign: TextAlign.left,
            //     ),
            //   ],
            // ),
            // buildHeight(20),
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            //   height: 250,
            //   child: PageView.builder(
            //     controller: _pageController,
            //     itemCount: menuList.length,
            //     itemBuilder: (context, i) {
            //       final item = menuList[i];
            //       final image = item['image'];
            //       final name = item['name'];
            //       final country = item['country'];
            //       final rating = item['rating'];

            //       return Card(
            //         margin: EdgeInsets.all(10),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(15),
            //         ),
            //         elevation: 5,
            //         child: Padding(
            //           padding: const EdgeInsets.all(10),
            //           child: Row(
            //             children: [
            //               ClipRRect(
            //                 borderRadius: BorderRadius.circular(15),
            //                 child: SizedBox(
            //                   height: 200,
            //                   width: 200,
            //                   child: image,
            //                 ),
            //               ),
            //               SizedBox(width: 10),
            //               Expanded(
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Text(
            //                       name,
            //                       style: TextStyle(
            //                         fontSize: 18,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                     SizedBox(height: 4),
            //                     Text(
            //                       country,
            //                       style: TextStyle(
            //                         fontSize: 14,
            //                         color: Colors.grey,
            //                       ),
            //                     ),
            //                     SizedBox(height: 4),
            //                     Text(
            //                       'Calificación: $rating',
            //                       style: TextStyle(
            //                         fontSize: 14,
            //                         color: Colors.green,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            // SizedBox(height: 20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: List.generate(menuList.length, (index) {
            //     return AnimatedContainer(
            //       duration: Duration(milliseconds: 300),
            //       margin: EdgeInsets.symmetric(horizontal: 5),
            //       height: 10,
            //       width: currentIndex == index ? 20 : 10,
            //       decoration: BoxDecoration(
            //         color: currentIndex == index ? primaryColor : Colors.grey,
            //         borderRadius: BorderRadius.circular(5),
            //       ),
            //     );
            //   }),
            // ),
            // buildHeight(70),
            // buildPrimaryButton(context, 'Pide en línea', () {
            //   buildDialogOnline(context);
            // }),
            // buildHeight(20),
            // buildPrimaryButton(context, 'Mis pedidos', () {}),
          ],
        ),
      ),
    );
  }
}
