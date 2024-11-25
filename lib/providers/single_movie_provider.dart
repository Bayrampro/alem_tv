import 'package:alem_tv/models/data/movies_list.dart';
import 'package:alem_tv/models/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final singleMovieProvider = Provider.family<Movie, int>((ref, id) {
  final singleMovie = moviesList.firstWhere((m) => m.id == id);
  return singleMovie;
});
