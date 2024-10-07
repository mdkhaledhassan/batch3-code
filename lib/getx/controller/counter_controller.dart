import 'package:get/state_manager.dart';

class CounterController extends GetxController {
  var count = 0.obs;

  void inc(){
    count++;
    refresh();
    update();
  }

  void dec(){
    count--;
    refresh();
    update();
  }

  @override
  void onInit() {
    count.value = 0;
    super.onInit();
  }
}