import 'package:alem_tv/models/data/movies_list.dart';
import 'package:alem_tv/models/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesListProvider = Provider<List<Movie>>((ref) => moviesList);
