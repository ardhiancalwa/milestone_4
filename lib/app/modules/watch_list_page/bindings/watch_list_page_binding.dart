import 'package:get/get.dart';

import '../controllers/watch_list_page_controller.dart';

class WatchListPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WatchListPageController>(
      () => WatchListPageController(),
    );
  }
}
