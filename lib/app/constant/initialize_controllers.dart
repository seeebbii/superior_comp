import 'package:get/get.dart';
import 'package:superior_comp/controller/navigation/navigation_controller.dart';
class InitializeControllers{

  static void init(){
    Get.put(NavigationController());

  }

  static void dispose(){
    // navigationController.dispose();
  }

}