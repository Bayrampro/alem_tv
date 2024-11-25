import 'dart:async';

import 'package:alem_tv/providers/movies_list_provider.dart';
import 'package:alem_tv/screens/home/widgets/main_slider.dart';
import 'package:alem_tv/screens/home/widgets/movies_slider.dart';
import 'package:alem_tv/screens/home/widgets/slider_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../ui/ui.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 1;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < 4) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final moviesList = ref.watch(moviesListProvider);
    return CustomScrollView(
      slivers: [
        const MainAppBar(),
        SliverToBoxAdapter(
          child: Column(
            children: [
              MainSlider(
                moviesList: moviesList,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                controller: _pageController,
              ),
              const SizedBox(height: 16),
              SmoothPageIndicator(
                controller: _pageController,
                count: 5,
                effect: const WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: Colors.blue,
                  dotColor: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 12.0)),
        SliverToBoxAdapter(
          child: SliderLabel(
            title: 'Популярно сейчас',
            onPressed: () {},
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8.0)),
        SliverToBoxAdapter(
          child: MoviesSlider(
            moviesList: moviesList,
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 12.0)),
        SliverToBoxAdapter(
          child: SliderLabel(
            title: 'Новинки',
            onPressed: () {},
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8.0)),
        SliverToBoxAdapter(
          child: MoviesSlider(
            moviesList: moviesList,
          ),
        ),
      ],
    );
  }
}
