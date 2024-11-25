import 'package:alem_tv/models/movie.dart';
import 'package:alem_tv/screens/home/widgets/popular_slider_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({
    super.key,
    required this.moviesList,
  });

  final List<Movie> moviesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => PopularMoviesSliderItem(
          onTap: () => context.go('/player/${moviesList[index].id}'),
          title: moviesList[index].title,
          imageUrl: moviesList[index].imageUrl,
          rating: moviesList[index].rating,
        ),
        itemCount: moviesList.length,
      ),
    );
  }
}
