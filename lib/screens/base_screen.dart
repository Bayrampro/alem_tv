import 'package:alem_tv/router/router.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: AppRouter.getCurrentIndex(context),
        onTap: (index) => AppRouter.goToPage(context, index),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Baş sahypa',
            backgroundColor: theme.primaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.tv),
            label: 'TV',
            backgroundColor: theme.primaryColor,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.videocam_outlined),
            label: 'Filmler',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_outlined),
            label: 'Seriallar',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'Girmek',
          ),
        ],
      ),
    );
  }
}
