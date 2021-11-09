import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/Screen/Components/colors.dart';
import 'package:shopify/Screen/Home%20Screen/Components/controllers.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final productcontroller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            padding: EdgeInsets.all(20),
            physics: ScrollPhysics(parent: null),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 20,
              mainAxisSpacing: 40,
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemCount: 8,
            itemBuilder: (context, index) {
              return Container(
                decoration: boxdecoration(),
                child: Stack(
                  children: [
                    Column(
                      children: [],
                    )
                  ],
                ),
              );
            }));
  }

  BoxDecoration boxdecoration() {
    return BoxDecoration(
      color: white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: boxshadow2,
    );
  }
}
