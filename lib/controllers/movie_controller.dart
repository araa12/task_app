import 'package:flutter_task_app/services/api_service.dart';
import 'package:flutter_task_app/models/movie.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  final RxList<Movie> _movies = RxList<Movie>([]);
  RxBool isLoading = false.obs;
  List<Movie> get movies => _movies;

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  void fetchMovies() async {
    isLoading(true);
    final movies = await HttpService().getMovies();
    _movies.value = movies;
    isLoading(false);
    update();
  }
}
