import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/Screen/Cart%20Screen/cart_list_controller.dart';
import 'package:shopify/Screen/Components/colors.dart';
import 'package:shopify/Screen/Home%20Screen/home_screen.dart';
import 'package:shopify/Screen/Ordere/order_controller.dart';

class OrderScreen extends StatelessWidget {
  final ordercontroller = Get.put(OrderController());
  final cartcontroller = Get.find<CartController>();
  final indexcontroller = Get.find<IndexController>();
  OrderScreen({Key? key}) : super(key: key);
  double borderradius = 32;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundgray,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderradius),
            topRight: Radius.circular(borderradius),
          ),
        ),
        child: ordercontroller.orderlist.isNotEmpty
            ? Column(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: boxshadow,
                      color: primary,
                      borderRadius: BorderRadius.circular(borderradius),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          textbold("Your Order is on the way", 22, white),
                          divider(),
                          textbold("Delivery info:", 18, white),
                          text(
                              "Address: House No A-100,Street 04, Bahadurabad, Karachi",
                              15,
                              white),
                          text("Phone No: +9203001234567", 15, white),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: boxshadow,
                        color: white,
                        borderRadius: BorderRadius.circular(borderradius),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textbold("Order Detail:", 20, black),
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: divider()),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: ordercontroller.orderlist.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: textbold(
                                    "${ordercontroller.orderlist[index].quantity} x",
                                    18,
                                    black,
                                  ),
                                  title: textbold(
                                      ordercontroller.orderlist[index].name,
                                      18,
                                      black),
                                  trailing: textbold(
                                      "\$${ordercontroller.orderlist[index].price}",
                                      18,
                                      black),
                                );
                              },
                            ),
                            divider(),
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      textbold("Subtotal", 20, black),
                                      textbold(
                                        "\$${cartcontroller.subtotal}",
                                        20,
                                        black,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      text("Delivery Fee", 18, black),
                                      text(
                                        "\$${cartcontroller.delivery}",
                                        18,
                                        black,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      text(
                                          "Discount ${cartcontroller.discount}%",
                                          18,
                                          black),
                                      text(
                                        "\$${cartcontroller.discountprice.toStringAsFixed(2)}",
                                        18,
                                        black,
                                      ),
                                    ],
                                  ),
                                  Container(
                                      margin: const EdgeInsets.all(5),
                                      child: divider()),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      textbold("Total Price", 20, black),
                                      textbold(
                                        "\$${cartcontroller.totalprice.toStringAsFixed(2)}",
                                        20,
                                        black,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You have not placed any order yet",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        indexcontroller.updateindex(0);
                        Get.to(HomeScreen());
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: primary,
                        size: 22,
                      ),
                      label: Text(
                        "Shop Now",
                        style: TextStyle(
                          fontSize: 22,
                          color: primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Divider divider() => Divider(
        color: grey.withOpacity(0.5),
        height: 5,
        thickness: 2,
        indent: 5,
        endIndent: 5,
      );

  Widget text(String txt, double fsize, Color color) {
    return Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fsize,
        color: color,
      ),
    );
  }

  Widget textbold(String txt, double fsize, Color color) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: fsize,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
