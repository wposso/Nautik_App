import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nautik_app/core/global/global.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: buildDrawer(context),
      appBar: AppBar(
        iconTheme: IconThemeData(color: primaryColor),
        backgroundColor: Colors.white,
        title: SizedBox(child: nautik_banner(), width: 250),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: CircleAvatar(
              backgroundColor: primaryColor,
              child: ClipOval(
                child: Container(
                  color: primaryColor,
                  child: Icon(Ionicons.cart_outline, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(padding: EdgeInsets.all(20), child: Column(children: [])),
    );
  }
}
