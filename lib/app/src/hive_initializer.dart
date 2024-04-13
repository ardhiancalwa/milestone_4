import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:milestone_4/app/src/movie_adapter.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieAdapter());
}