import 'package:get/get.dart';
import 'package:shopify/Screen/Home%20Screen/Models/models.dart';

class BrandNameController extends GetxController {
  var brandnamelist = <BrandNameModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchproduct();
  }

  void fetchproduct() {
    brandnamelist.value = brandName;
  }
}

class ProductController extends GetxController {
  var productlist = <Products>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchproduct();
  }

  void fetchproduct() {
    productlist.value = product;
  }
}
