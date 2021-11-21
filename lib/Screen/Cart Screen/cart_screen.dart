import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/Screen/Cart%20Screen/cart_list_controller.dart';
import 'package:shopify/Screen/Components/colors.dart';
import 'package:shopify/Screen/Detailed%20Screen/controllers.dart';
import 'package:shopify/Screen/Home%20Screen/Components/controllers.dart';
import 'package:shopify/Screen/Ordere/order_controller.dart';
import 'package:shopify/Screen/Splash%20Screen/splash_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartcontroller = Get.find<CartController>();

  final colorcontroller = Get.find<Colorcontroller>();
  final indexcontroller = Get.find<IndexController>();

  final productcontroller = Get.put(ProductController());
  final ordercontroller = Get.put(OrderController());

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              totalbill(),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: GetX<CartController>(builder: (controller) {
                  return txtbold(
                      "${cartcontroller.cartlist.length} items available in your Cart",
                      18);
                }),
              ),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cartcontroller.cartlist.length,
                  itemBuilder: (contex, index) {
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: boxshadow,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 100,
                                  child: Image.asset(
                                      cartcontroller.cartlist[index].img),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
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
                                        const Icon(
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
                            ],
                          ),
                        ),
                        Align(
                          alignment: const Alignment(1, -1),
                          child: IconButton(
                            onPressed: () {
                              cartcontroller.cartlist.removeAt(index);
                              productcontroller.productlist[index].cartAdded =
                                  false.obs;
                              cartcontroller.subtotalupdate();
                            },
                            icon: Icon(
                              Icons.delete,
                              color: grey,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Obx(
                () => cartcontroller.cartlist.isNotEmpty
                    ? Container(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(150, 50),
                              primary: primary,
                              onPrimary: white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              )),
                          onPressed: () {
                            ordercontroller.orderlist
                                .addAll(cartcontroller.cartlist);
                            indexcontroller.updateindex(3);
                            cartcontroller.subtotalupdate();
                            Get.to(const SplashScreen());
                          },
                          child: const Text(
                            "Place Order",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        width: 0,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//quantity widget
  Row quantityfunction(int index) {
    return Row(
      children: [
        txtbold("Quantity", 20),
        IconButton(
          onPressed: () {
            // if (cartcontroller.cartlist[index].quantity > 1) {
            //   cartcontroller.cartlist[index].quantity =
            //       cartcontroller.cartlist[index].quantity - 1;
            // } else {}
            if (cartcontroller.cartlist[index].quantity > 1) {
              cartcontroller.quantitydecrease(index);
              cartcontroller.subtotalupdate();
            } else {}
          },
          icon: const Icon(Icons.remove),
        ),
        GetBuilder<CartController>(
          builder: (controller) {
            return txtbold(controller.cartlist[index].quantity.toString(), 20);
          },
        ),
        GetBuilder<CartController>(
          builder: (controller) {
            return IconButton(
              onPressed: () {
                controller.quantityupdate(index);
                controller.subtotalupdate();
              },
              icon: const Icon(Icons.add),
            );
          },
        ),
      ],
    );
  }

//pricing widget
  Widget totalbill() {
    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(30),
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
              GetBuilder<CartController>(builder: (controller) {
                return Text(
                  "\$${cartcontroller.subtotal}",
                  style: totaltext,
                );
              }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivey Fee",
                style: totaltext,
              ),
              GetBuilder<CartController>(builder: (controller) {
                return Text(
                  "\$${cartcontroller.delivery}",
                  style: totaltext,
                );
              }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Discount ${cartcontroller.discount}%",
                style: totaltext,
              ),
              GetBuilder<CartController>(builder: (controller) {
                return Text(
                  "-${cartcontroller.discountprice.toStringAsFixed(2)}",
                  style: totaltext,
                );
              }),
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
              GetBuilder<CartController>(builder: (controller) {
                return Text(
                  "\$${cartcontroller.total.toStringAsFixed(2)}",
                  style: totaltext,
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

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
