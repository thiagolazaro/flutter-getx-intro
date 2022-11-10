import 'package:get/get.dart';
import 'package:getx_intro/user_model.dart';

class UserController extends GetxController {
  Rx<UserModel> user = UserModel().obs;

  void setUserName(String userName) {
    // user.update((obj) {
    //   obj?.name = userName;
    // });

    user.value.name = userName;
    user.refresh();
  }

  void setUserAge(int userAge) {
    user.update((obj) {
      obj?.age = userAge;
    });
  }
}
