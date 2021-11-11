import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/Screen/Components/colors.dart';
import 'package:shopify/Screen/Home%20Screen/Components/controllers.dart';
import 'package:shopify/Screen/Home%20Screen/Models/models.dart';

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
          padding: EdgeInsets.all(10),
          physics: ScrollPhysics(parent: null),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemCount: productcontroller.productlist.length,
          itemBuilder: (context, index) => ProductItemCard(
              productitem: productcontroller.productlist[index])),
    );
  }
}

class ProductItemCard extends StatelessWidget {
  final Products productitem;

  ProductItemCard({Key? key, required this.productitem}) : super(key: key);
  Color favorite = grey;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxdecoration(),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.topCenter,
                child: Image.asset(
                  productitem.img,
                  height: 100,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 10),
                child: Text(
                  productitem.name,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: black,
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left: 10),
                child: Text(
                  "\$${productitem.price}",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 30,
                  child: star()),
            ],
          ),
          Align(
            alignment: Alignment(1, -1),
            child: IconButton(
                onPressed: () {
                  
                },
                icon: Icon(
                  Icons.favorite,
                  color: favorite,
                )),
          )
        ],
      ),
    );
  }

  BoxDecoration boxdecoration() {
    return BoxDecoration(
      color: white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: boxshadow2,
    );
  }

  Widget star() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Icon(
              index < productitem.star ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 20,
            )
          ],
        );
      },
    );
  }
}
