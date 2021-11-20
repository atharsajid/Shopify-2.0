import 'package:get/get.dart';
import 'package:shopify/Screen/Home%20Screen/Models/models.dart';

class CartController extends GetxController {
  var cartlist = <Products>[].obs;
  double get totalprice => cartlist.fold(
      0, (sum, element) => sum + element.price * element.quantity);
  double subtotal = 0;
  double delivery = 0;
  double discount = 10;
  double discountprice = 0;
  double total = 0;
  subtotalupdate() {
    subtotal = totalprice;

    discountprice = subtotal * discount / 100;
    cartlist.isNotEmpty ? delivery = 5 : delivery = 0;
    total = totalprice + delivery - (subtotal * discount ~/ 100);
    update();
  }

  addtocart(Products product) {
    cartlist.add(product);
  }

  quantitydecrease(int index) {
    cartlist[index].quantity = cartlist[index].quantity - 1;

    update();
  }

  quantityupdate(int index) {
    cartlist[index].quantity = cartlist[index].quantity + 1;

    update();
  }

//added to cart botton

}

class IndexController extends GetxController {
  var currentind = 0;

  updateindex(int index) {
    currentind = index;
    update();
  }
}
