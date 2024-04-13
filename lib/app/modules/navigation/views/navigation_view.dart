import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:milestone_4/app/modules/search_page/views/search_page_view.dart';
import 'package:milestone_4/app/modules/watch_list_page/views/watch_list_page_view.dart';
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
                SearchPageView(),
                WatchListPageView(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            showUnselectedLabels: true,
            unselectedItemColor: greyDark,
            selectedItemColor: primaryColor,
            type: BottomNavigationBarType.fixed,
            onTap: controller.changeTab,
            currentIndex: controller.tabIndex.value,
            backgroundColor: backgroundColor,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/icons/navHome.png',
                  width: 27,
                  height: 27,
                ),
                label: 'Home',
                activeIcon: Image.asset(
                  'assets/images/icons/navHome.png',
                  width: 27,
                  height: 27,
                  color: primaryColor,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/icons/navSearch.png',
                  width: 27,
                  height: 27,
                ),
                label: 'Search',
                activeIcon: Image.asset(
                  'assets/images/icons/navSearch.png',
                  width: 27,
                  height: 27,
                  color: primaryColor,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/icons/navWatchList.png',
                  width: 27,
                  height: 27,
                ),
                label: 'Watch List',
                activeIcon: Image.asset(
                  'assets/images/icons/navWatchList.png',
                  width: 27,
                  height: 27,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ));
  }
}
