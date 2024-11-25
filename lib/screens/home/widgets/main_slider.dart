import 'package:alem_tv/models/movie.dart';
import 'package:alem_tv/screens/home/widgets/main_slider_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainSlider extends StatelessWidget {
  const MainSlider({
    super.key,
    required this.onPageChanged,
    required this.controller,
    required this.moviesList,
  });

  final void Function(int index) onPageChanged;
  final PageController controller;
  final List<Movie> moviesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView(
          controller: controller,
          onPageChanged: onPageChanged,
          children: moviesList
              .map(
                (movie) => MainSliderItem(
                  imageUrl: movie.mainImageUrl,
                  onTap: () => context.go('/player/${movie.id}'),
                ),
              )
              .toList()),
    );
  }
}
