import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/Screen/Cart%20Screen/cart_list_controller.dart';
import 'package:shopify/Screen/Components/colors.dart';
import 'package:shopify/Screen/Home%20Screen/Widgets/app_bar_widget.dart';
import 'package:shopify/Screen/Home%20Screen/Widgets/bottom_app_bar.dart';

import 'package:shopify/Screen/Home%20Screen/Widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  final indexcontroller = Get.put(
    IndexController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      drawer: drwer(),
      body: GetBuilder<IndexController>(builder: (controller) {
        return screens[controller.currentind];
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        foregroundColor: white,
        onPressed: () {
          indexcontroller.updateindex(2);
        },
        child: Icon(
          Icons.shopping_bag_outlined,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Bottomappbar(),
    );
  }
}
