import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/Screen/Cart%20Screen/cart_list_controller.dart';
import 'package:shopify/Screen/Components/colors.dart';
import 'package:shopify/Screen/Home%20Screen/Widgets/app_bar_widget.dart';
import 'package:shopify/Screen/Home%20Screen/Widgets/brand_name.dart';
import 'package:shopify/Screen/Home%20Screen/Widgets/product_card.dart';

class MainHomeScree extends StatelessWidget {
  final cartcontroller = Get.put(
    CartController(),
  );

  double borderradius = 32;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: backgroundgray,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderradius),
          topRight: Radius.circular(borderradius),
        ),
      ),
      child: Column(
        children: [
          brandandprod("Choose Brand"),
          Container(
            height: 110,
            child: BranName(),
          ),
          brandandprod("Beats Products"),
          ProductCard(),
        ],
      ),
    );
  }
}
