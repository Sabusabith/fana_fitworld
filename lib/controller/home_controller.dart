import 'package:get/get.dart';
import '../Login/Shared.dart';

class HomeController extends GetxController {
  var name = 'Fana Fit World'.obs;
  var email = 'Fana Fit World'.obs;

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  Future<void> getUserData() async {
    name.value = await getSavedName("name") ?? '';
    email.value = await getSavedName("email") ?? '';
  }
}
