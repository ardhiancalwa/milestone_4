import 'package:dio/dio.dart';

import 'movie.dart';

const String _baseUrl = 'https://api.themoviedb.org/3';
const String _apiKey = '64ac0625e543cba551864700f99bd048'; // Replace with your actual key

class TmdbApiService {
  final Dio _dio = Dio();

  Future<List<Movie>> fetchPopularMovies() async {
    try {
      final response = await _dio.get(
        '$_baseUrl/movie/popular',
        queryParameters: {'api_key': _apiKey, 'language': 'en-US'},
      );

      final results = response.data['results'] as List;
      return results.map((movieData) => Movie.fromJson(movieData)).toList();
    } on DioError catch (e) {
      // Handle DioError (e.g., network errors, status code errors)
    }
  }
}
