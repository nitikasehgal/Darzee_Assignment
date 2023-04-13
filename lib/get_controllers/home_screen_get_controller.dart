import 'package:get/get.dart';

class HomeScreenGetController extends GetxController {
  var myIndex = 0.obs;

  void changeTabIndex(int index) {
    myIndex.value = index;
  }
}
