import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomescreenController extends GetxController {
  var selectedScreen = 0.obs;
  updateSelection(index) {
    selectedScreen.value = index;
  }
}
