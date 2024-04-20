import 'package:dio/dio.dart';
import 'package:milestone_4/src/models/user_model.dart';

class UserService {
  final Dio dio = Dio();
  final String baseUrl = 'https://reqres.in/api/users';

  Future<List<User>> getUsers() async {
    try {
      final response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        final List<User> users = [];
        final data = response.data['data'];
        data.forEach((user) {
          users.add(User.fromJson(user));
        });
        return users;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }
}