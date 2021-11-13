import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/Screen/Cart%20Screen/cart_list_controller.dart';
import 'package:shopify/Screen/Components/colors.dart';
import 'package:shopify/Screen/Detailed%20Screen/controllers.dart';
import 'package:shopify/Screen/Detailed%20Screen/detail_screen.dart';

class CartScreen extends StatelessWidget {
  final cartcontroller = Get.put(CartController());
  final colorcontroller = Get.find<Colorcontroller>();
  double borderradius = 32;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundgray,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderradius),
            topRight: Radius.circular(borderradius),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: cartcontroller.cartlist.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: boxshadow,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 100,
                              child: Image.asset(
                                cartcontroller.cartlist[index].img,
                                height: 80,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  detailtext(
                                      cartcontroller.cartlist[index].name,
                                      20,
                                      black),
                                  Row(
                                    children: [
                                      detailtext("Color : ", 18, black),
                                      Icon(
                                        Icons.circle,
                                        size: 18,
                                        color: colorlist[
                                            colorcontroller.isSelected],
                                      ),
                                    ],
                                  ),
                                  detailtext(
                                      "\$${cartcontroller.cartlist[index].price}",
                                      22,
                                      primary),
                                  Row(
                                    children: [
                                      detailtext("Quantity", 20, black),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailtext(String name, double fontsize, Color color) {
    return Text(
      name,
      style: TextStyle(
          fontSize: fontsize, fontWeight: FontWeight.bold, color: color),
    );
  }
}
