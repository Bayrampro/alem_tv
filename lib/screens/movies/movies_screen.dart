import 'package:alem_tv/ui/ui.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const MainAppBar(),
          SliverFillRemaining(
            child: Center(
              child: Text(
                'Раздел для Кино',
                style: theme.textTheme.titleLarge,
              ),
            ),
          )
        ],
      ),
    );
  }
}
