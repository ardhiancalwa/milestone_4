import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/watch_list_page_controller.dart';

class WatchListPageView extends GetView<WatchListPageController> {
  const WatchListPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WatchListPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WatchListPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
