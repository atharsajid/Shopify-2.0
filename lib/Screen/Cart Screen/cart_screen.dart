import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/Screen/Cart%20Screen/cart_list_controller.dart';
import 'package:shopify/Screen/Components/colors.dart';
import 'package:shopify/Screen/Detailed%20Screen/controllers.dart';
import 'package:shopify/Screen/Detailed%20Screen/detail_screen.dart';

class CartScreen extends StatelessWidget {
  final cartcontroller = Get.find<CartController>();
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
            totalbill(),
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
                            child:
                                Image.asset(cartcontroller.cartlist[index].img),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                txtbold(
                                  cartcontroller.cartlist[index].name,
                                  20,
                                ),
                                txtboldcolor(
                                  "\$${cartcontroller.cartlist[index].price}",
                                  22,
                                  primary,
                                ),
                                Row(
                                  children: [
                                    txtbold("Color : ", 18),
                                    Icon(
                                      Icons.circle,
                                      color: Colors.orange,
                                      size: 18,
                                    ),
                                  ],
                                ),
                                quantityfunction(index),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

//quantity function widget
  Row quantityfunction(int index) {
    return Row(
      children: [
        txtbold("Quantity", 20),
        IconButton(
          onPressed: () {
            if (cartcontroller.cartlist[index].quantity > 1) {
              cartcontroller.cartlist[index].quantity =
                  cartcontroller.cartlist[index].quantity - 1;
            } else {}
          },
          icon: Icon(Icons.remove),
        ),
        GetBuilder<CartController>(
          builder: (controller) {
            return GetX<CartController>(
              builder: (controller) {
                return txtbold(
                    controller.cartlist[index].quantity.toString(), 20);
              },
            );
          },
        ),
        IconButton(
          onPressed: () {
            cartcontroller.cartlist[index].quantity =
                cartcontroller.cartlist[index].quantity + 1;
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

//bill container widget
  Widget totalbill() {
    return Container(
      height: 200,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: boxshadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sub-Total",
                style: totaltext,
              ),
              Text(
                "0",
                style: totaltext,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivey Fee",
                style: totaltext,
              ),
              Text(
                "0",
                style: totaltext,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Discount",
                style: totaltext,
              ),
              Text(
                "0",
                style: totaltext,
              ),
            ],
          ),
          Divider(
            color: grey,
            endIndent: 10,
            indent: 10,
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Price",
                style: totaltext,
              ),
              Text(
                "0",
                style: totaltext,
              ),
            ],
          ),
        ],
      ),
    );
  }

//text widegt
  final totaltext = TextStyle(
    color: white,
    fontSize: 18,
  );
  Widget txt(String text, double fontsize) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
      ),
    );
  }

  Widget txtbold(String text, double fontsize) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget txtboldcolor(String text, double fontsize, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
