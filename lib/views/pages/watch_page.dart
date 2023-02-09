import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_app/controllers/movie_controller.dart';
import 'package:flutter_task_app/utils/utils.dart';
import 'package:flutter_task_app/utils/colors.dart';
import 'package:flutter_task_app/views/pages/movie_detail_page.dart';
import 'package:get/get.dart';

import 'components/movie_card.dart';

class WatchPage extends StatelessWidget {
  const WatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(
            Icons.menu_outlined,
            size: 24,
          ),
          backgroundColor: AppColor().primaryColor,
          centerTitle: true,
          title: const Text(
            'Watch',
          )),
      body: GetBuilder<MovieController>(
          init: MovieController(),
          builder: (controller) {
            return controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: Get.height / 2.5,
                        color: AppColor().primaryColor,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: Get.height / 2.5,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 1.0,
                            aspectRatio: 2.0,
                            initialPage: 2,
                          ),
                          items: controller.movies.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(() => MovieDetailPage(movie: i));
                                  },
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: CachedNetworkImage(
                                        fit: BoxFit.fill,
                                        imageUrl:
                                            baseImageUrl + i.backdropPath!,
                                      )),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Watch Movies',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                          child: ListView.builder(
                              itemCount: controller.movies.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return MovieCard(
                                    movie: controller.movies[index]);
                              })),
                    ],
                  );
          }),
    );
  }
}
