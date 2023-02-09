import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_task_app/models/movie.dart';
import 'package:flutter_task_app/utils/utils.dart';
import 'package:flutter_task_app/utils/colors.dart';
import 'package:get/get.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 70,
        width: 240,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Colors.indigo.withOpacity(.6),
            borderRadius: BorderRadius.circular(20)),
        child: const Center(
          child: Text(
            'Resume Playing',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _upperHeaderWithImage(),
          SizedBox(
            height: Get.height / 2,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 10, bottom: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Directed By Jordan Peele'),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'The Cast',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _castList(),
                    const Text(
                      'The Story Line',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      movie.overview ?? 'No Overview',
                      style: const TextStyle(
                          fontSize: 16, letterSpacing: 2, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _upperHeaderWithImage() {
    return Container(
        height: 340,
        color: AppColor().primaryColor,
        child: Stack(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: baseImageUrl + movie.backdropPath!),
            ),
            Positioned(
              top: 150,
              left: 40,
              child: Container(
                height: 150,
                width: 100,
                color: Colors.white,
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: baseImageUrl + movie.posterPath!),
              ),
            ),
            Positioned(
              top: 210,
              left: 160,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250,
                      child: Text(
                        movie.title ?? 'No Name',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                      ),
                      child: Text(movie.voteAverage.toString()),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    SizedBox(
                      height: 20,
                      width: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            );
                          }),
                    ),
                    Text(
                        '${movie.releaseDate != null ? movie.releaseDate?.substring(0, 4) : ''} - Adventure'),
                    const Text(
                      '2:16',
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: 40,
                left: 20,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(.3)),
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )),
          ],
        ));
  }

  SizedBox _castList() {
    return SizedBox(
        height: 70,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
              10,
              (index) => Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.only(
                      left: index == 0 ? 0 : 10,
                    ),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                          'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg'),
                    ),
                  )),
        ));
  }
}
