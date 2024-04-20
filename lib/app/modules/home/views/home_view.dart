import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milestone_4/app/theme/color.dart';
import 'package:milestone_4/src/models/user_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List User'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  // Filter users based on input value
                  controller.users.value = controller.users
                      .where((user) => user.firstName
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                  controller.users.value = controller.users
                      .where((User) => User.lastName
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: black,
                    fontSize: 16,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 26,
                    color: black,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: blueGrey),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.users.length,
                  itemBuilder: (context, index) {
                    final user = controller.users[index];
                    return GestureDetector(
                      onTap: () {
                        Get.dialog(Center(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Container(
                              height: 275,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(user.avatar),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '${user.firstName} ${user.lastName}',
                                    style: GoogleFonts.poppins(
                                      color: black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    user.email,
                                    style: GoogleFonts.poppins(
                                      color: black,
                                      fontSize: 14,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          'Edit',
                                          style: TextStyle(
                                            color: white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          'Hapus',
                                          style: TextStyle(
                                            color: white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.avatar),
                        ),
                        title: Text('${user.firstName} ${user.lastName}'),
                        subtitle: Text(user.email),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
