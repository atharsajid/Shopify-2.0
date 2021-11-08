import 'package:flutter/material.dart';
import 'package:shopify/Screen/Components/colors.dart';
import 'package:shopify/Screen/Home%20Screen/Widgets/app_bar_widget.dart';
import 'package:shopify/Screen/Home%20Screen/Widgets/bottom_app_bar.dart';
import 'package:shopify/Screen/Home%20Screen/Widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double borderradius = 32;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(),
        drawer: drwer(),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: backgroundgray,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(borderradius),
                    topRight: Radius.circular(borderradius),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: floatingbutton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Bottomappbar(),);
  }
}
