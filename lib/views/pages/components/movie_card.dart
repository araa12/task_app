import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_task_app/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_app/utils/utils.dart';
import '../movie_detail_page.dart';
import 'package:get/get.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: InkWell(
        onTap: () {
          Get.to(() => MovieDetailPage(movie: movie));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              width: 140,
              height: 200,
              child: CachedNetworkImage(
                  fit: BoxFit.fill, imageUrl: baseImageUrl + movie.posterPath!),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 2),
              child: Text(
                nameFormatter(movie.title ?? "No Name"),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
              "Action>Adevnture",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
