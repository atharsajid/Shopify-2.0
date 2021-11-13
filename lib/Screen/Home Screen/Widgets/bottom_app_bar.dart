import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/Screen/Cart%20Screen/cart_list_controller.dart';
import 'package:shopify/Screen/Cart%20Screen/cart_screen.dart';
import 'package:shopify/Screen/Components/colors.dart';
import 'package:shopify/Screen/Favorite/favorite_screen.dart';
import 'package:shopify/Screen/Home%20Screen/home_screen.dart';
import 'package:shopify/Screen/Home%20Screen/main_home_screen.dart';
import 'package:shopify/Screen/Ordere/order_screen.dart';
import 'package:shopify/Screen/Profile/profile_screen.dart';

class Bottomappbar extends StatelessWidget {
  final indcontroller = Get.find<IndexController>();
  double borderradius = 32;
  // int isiconselected = 0;
  int midicon = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.075,
      decoration: BoxDecoration(
        boxShadow: boxshadow,
        color: white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderradius),
            topRight: Radius.circular(borderradius)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ListView.builder(
            itemCount: icon.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.18,
                child: GetBuilder<IndexController>(
                  builder: (controller) {
                    return IconButton(
                      onPressed: () {
                        controller.currentind != midicon
                            ? controller.updateindex(index)
                            : controller.updateindex(0);
                      },
                      icon: Icon(
                        icon[index],
                        color: midicon == index
                            ? primary.withOpacity(0.0)
                            : controller.currentind == index
                                ? primary
                                : grey,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

List<IconData> icon = [
  Icons.home,
  Icons.favorite,
  Icons.circle,
  Icons.task,
  Icons.person,
];

Widget floatingbutton() {
  return FloatingActionButton(
    backgroundColor: primary,
    foregroundColor: white,
    onPressed: () {
      
    },
    child: Icon(
      Icons.shopping_bag_outlined,
    ),
  );
}

final screens = [
  MainHomeScree(),
  FavoriteScreen(),
  CartScreen(),
  OrderScreen(),
  ProfilScreen(),
];
