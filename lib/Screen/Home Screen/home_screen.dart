import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/Screen/Cart%20Screen/cart_list_controller.dart';
import 'package:shopify/Screen/Components/colors.dart';
import 'package:shopify/Screen/Detailed%20Screen/controllers.dart';
import 'package:shopify/Screen/Drawer/drawer.dart';
import 'package:shopify/Screen/Home%20Screen/Widgets/app_bar_widget.dart';
import 'package:shopify/Screen/Home%20Screen/Widgets/bottom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  final colorcontroller = Get.put(
    Colorcontroller(),
  );
  final indexcontroller = Get.put(
    IndexController(),
  );

  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      drawer: drawer(),
      body: GetBuilder<IndexController>(
        builder: (controller) {
          return screens[controller.currentind];
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        foregroundColor: white,
        onPressed: () {
          indexcontroller.updateindex(2);
        },
        child: const Icon(
          Icons.shopping_bag_outlined,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Bottomappbar(),
    );
  }
}
