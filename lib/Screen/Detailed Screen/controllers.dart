import 'package:get/get.dart';

class Colorcontroller extends GetxController {
  int isSelected = 0;
  bool cartadded = false;
  updatecolor(int index) {
    isSelected = index;
    update();
  }

  cartaddedupdate(bool bool) {
    cartadded = bool;
    update();
  }
}
