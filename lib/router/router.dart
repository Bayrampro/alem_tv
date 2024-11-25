import 'package:alem_tv/screens/base_screen.dart';
import 'package:alem_tv/screens/home/home_screen.dart';
import 'package:alem_tv/screens/video_player/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/movies/movies_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/series/series_screen.dart';
import '../screens/tv/tv_screen.dart';

class AppRouter {
  static const String home = '/home';
  static const String tv = '/tv';
  static const String movies = '/movies';
  static const String series = '/series';
  static const String profile = '/profile';
  static const String player = '/player/:id';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      ShellRoute(
        builder: (context, state, child) => BaseScreen(child: child),
        routes: [
          GoRoute(
            path: home,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeScreen()),
          ),
          GoRoute(
            path: tv,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: TvScreen()),
          ),
          GoRoute(
            path: movies,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: MoviesScreen()),
          ),
          GoRoute(
            path: series,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SeriesScreen()),
          ),
          GoRoute(
            path: profile,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProfileScreen()),
          ),
        ],
      ),
      GoRoute(
        path: player,
        builder: (context, state) {
          final strId = state.pathParameters['id']!;
          final id = int.parse(strId);
          return VideoPlayerScreen(id: id);
        },
      ),
    ],
  );

  static int getCurrentIndex(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    switch (state.fullPath) {
      case home:
        return 0;
      case tv:
        return 1;
      case movies:
        return 2;
      case series:
        return 3;
      case profile:
        return 4;
      default:
        return 0;
    }
  }

  // Перейти на маршрут по индексу BottomNavigationBar
  static void goToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(home);
        break;
      case 1:
        context.go(tv);
        break;
      case 2:
        context.go(movies);
        break;
      case 3:
        context.go(series);
        break;
      case 4:
        context.go(profile);
        break;
    }
  }
}
