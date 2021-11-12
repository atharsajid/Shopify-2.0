import 'package:get/get.dart';

class Colorcontroller extends GetxController {
  int isSelected = 0;

  updatecolor(int index) {
    isSelected = index;
    update();
  }
}
