import 'package:get/get.dart';
import 'package:milestone_4/app/data/models/user_service.dart';

import '../../../../src/models/user_model.dart';

class HomeController extends GetxController {
  final userService = UserService();
  var users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    try {
      var userList = await userService.getUsers();
      users.assignAll(userList);
    } catch (e) {
      print(e.toString());
    }
  }
}
