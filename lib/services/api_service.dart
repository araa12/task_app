import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movie.dart';

class HttpService {
  final movieApi =
      'https://api.themoviedb.org/3/trending/all/day?api_key=39cf98d7db1ad3069227393fa6315d10';

  Future<List<Movie>> getMovies() async {
    final response = await http.get(Uri.parse(movieApi));
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final responseBody = MoviesRepsone.fromJson(decoded);
      return responseBody.results!;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
