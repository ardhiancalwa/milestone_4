import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:milestone_4/app/theme/color.dart';

import '../../home/views/home_view.dart';
import '../controllers/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Obx(
            () => IndexedStack(
              index: controller.tabIndex.value,
              children: [
                HomeView(),
                HomeView(),
                HomeView(),
                HomeView(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            showUnselectedLabels: true,
            unselectedItemColor: Colors.black38,
            selectedItemColor: blue,
            type: BottomNavigationBarType.fixed,
            onTap: controller.changeTab,
            currentIndex: controller.tabIndex.value,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/icons/navBeranda.png',
                  width: 27,
                  height: 27,
                ),
                label: 'Beranda',
                activeIcon: Image.asset(
                  'assets/images/icons/navBeranda.png',
                  width: 27,
                  height: 27,
                  color: blue,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/icons/navKonsultasi.png',
                  width: 27,
                  height: 27,
                ),
                label: 'Konsultasi',
                activeIcon: Image.asset(
                  'assets/images/icons/navKonsultasi.png',
                  width: 27,
                  height: 27,
                  color: blue,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/icons/navNotifikasi.png',
                  width: 27,
                  height: 27,
                ),
                label: 'Notifikasi',
                activeIcon: Image.asset(
                  'assets/images/icons/navNotifikasi.png',
                  width: 27,
                  height: 27,
                  color: blue,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/icons/navProfile.png',
                  width: 27,
                  height: 27,
                ),
                label: 'Profile',
                activeIcon: Image.asset(
                  'assets/images/icons/navProfile.png',
                  width: 27,
                  height: 27,
                  color: blue,
                ),
              ),
            ],
          ),
        ),
        );
  }
}
