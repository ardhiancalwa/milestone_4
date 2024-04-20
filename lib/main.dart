import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milestone_4/app/modules/navigation/views/navigation_view.dart';
import 'package:milestone_4/app/routes/app_pages.dart';
import 'package:milestone_4/src/models/user_model.dart';
import 'app/modules/home/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final user = Rx<User?>(null);

  void updateUser(User? newUser) {
    user(newUser);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}
