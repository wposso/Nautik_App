// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/global/global.dart';
import 'package:nautik_app/core/global/globalDrawer.dart';
import 'package:nautik_app/core/views/homeView/viewModel.dart';
import 'package:nautik_app/core/views/loginView/viewModel.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Center(
          child: AppBar(
            leading: IconButton(
              icon: Icon(Ionicons.menu, size: 40, color: primaryColor),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            iconTheme: IconThemeData(color: primaryColor),
            backgroundColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: SizedBox(width: 310, height: 80, child: nautik_banner()),
              ),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10, top: 10),
                child: GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.yellow,
                    child: ClipOval(
                      child: Container(
                        color: primaryColor,
                        alignment: Alignment.center,
                        child: Icon(
                          Ionicons.cart_outline,
                          color: Colors.white,
                          size: 27,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            buildHeight(20),
            SearchBar(
              backgroundColor: WidgetStatePropertyAll(searchbarColor),
              leading: Icon(Ionicons.search_outline),
              hintText: 'Buscar platos',
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              ),
            ),
            buildHeight(50),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Platos Populares',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Aquí podrás ver algunos de los platos calificados como los más populares en diferentes partes del mundo. ¡Descubre sabores únicos y evalúa tus favoritos!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.left,
            ),
            buildHeight(20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              height: 250,
              child: PageView.builder(
                controller: _pageController,
                itemCount: menuList.length,
                itemBuilder: (context, i) {
                  final item = menuList[i];
                  final image = item['image'];
                  final name = item['name'];
                  final country = item['country'];
                  final rating = item['rating'];

                  return Card(
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: image,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  country,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Calificación: $rating',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(menuList.length, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 10,
                  width: currentIndex == index ? 20 : 10,
                  decoration: BoxDecoration(
                    color: currentIndex == index ? primaryColor : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }),
            ),
            buildHeight(70),
            buildPrimaryButton(context, 'Pide en línea', () {
              buildDialogOnline(context);
            }),
            buildHeight(20),
            buildPrimaryButton(context, 'Mis pedidos', () {}),
          ],
        ),
      ),
    );
  }
}
