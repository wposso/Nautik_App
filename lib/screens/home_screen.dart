// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/utils/ui_helpers.dart';
import 'package:nautik_app/core/widgets/global_drawer.dart';
import 'package:nautik_app/core/widgets/global_footer.dart';
import 'package:nautik_app/modules/auth/controllers/authentication_controller.dart';
import 'package:nautik_app/modules/auth/models/user_model.dart';
import 'package:nautik_app/modules/auth/widgets/form_widget.dart';
import 'package:nautik_app/modules/products/data/mock_menu_data.dart';
import 'package:nautik_app/themes/colors.dart';
import 'package:nautik_app/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';

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
    final model = Provider.of<AuthenticationController>(context);
    return Scaffold(
      drawer: GlobalDrawer(),
      key: _scaffoldKey,
      bottomNavigationBar: buildGlobalFooter(context),
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
              model.emailController.text.isEmpty
                  ? 'Melissa Mora G.'
                  : getUserName(model.emailController.text),
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
                  return Container(
                    height: 250,
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: item['image'],
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              backgroundColor: Colors.deepOrange,
                              foregroundColor: Colors.white,
                              fixedSize: Size(150, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
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
                          right: 25,
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
                              Text(
                                'haz tu pedido ahora',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
            buildHeight(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Historial de pedidos',
                  style: TextStyle(
                    fontSize: generalText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            buildHeight(10),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Ionicons.bar_chart_outline),
                title: Text('Hisorial'),
                subtitle: Text('Ver historial de pedidos'),
                trailing: Icon(Ionicons.chevron_forward_outline),
              ),
            ),
            buildHeight(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    fixedSize: Size(160, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Categories');
                  },
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
                    elevation: 5,
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    fixedSize: Size(160, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
