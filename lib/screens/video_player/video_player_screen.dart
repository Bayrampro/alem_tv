import 'package:alem_tv/providers/movies_list_provider.dart';
import 'package:alem_tv/providers/single_movie_provider.dart';
import 'package:alem_tv/screens/video_player/widgets/action_content.dart';
import 'package:alem_tv/screens/video_player/widgets/reccomended_list_video_item.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class VideoPlayerScreen extends ConsumerStatefulWidget {
  const VideoPlayerScreen({super.key, required this.id});

  final int id;

  @override
  ConsumerState<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends ConsumerState<VideoPlayerScreen> {
  BetterPlayerController? _betterPlayerController;

  @override
  void initState() {
    super.initState();
    final movie = ref.read(singleMovieProvider(widget.id));
    const betterPlayerConfiguration = BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      autoPlay: true,
      looping: false,
      controlsConfiguration: BetterPlayerControlsConfiguration(
        enableSkips: true,
        enablePlaybackSpeed: true,
        enableSubtitles: false,
      ),
    );

    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration)
      ..setupDataSource(BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        movie.m3u8Url,
      ));
  }

  @override
  void dispose() {
    _betterPlayerController?.dispose();
    super.dispose();
  }

  void _showAction(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => const ActionContent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final moviesList = ref.watch(moviesListProvider);
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 250,
                child: BetterPlayer(
                  controller: _betterPlayerController!,
                ),
              ),
              Positioned(
                top: 20.0,
                left: 0.0,
                child: IconButton(
                  onPressed: () => context.go('/home'),
                  icon: Icon(Icons.arrow_back, color: theme.canvasColor),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: moviesList.length,
              itemBuilder: (context, index) {
                final movie = moviesList[index];
                return ReccomendedListVideoItem(
                  movie: movie,
                  onPressed: () {
                    context.go('/player/${movie.id}');
                  },
                  onMore: () => _showAction(context),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
