import 'package:alem_tv/models/movie.dart';
import 'package:flutter/material.dart';

class ReccomendedListVideoItem extends StatelessWidget {
  const ReccomendedListVideoItem({
    super.key,
    required this.movie,
    required this.onPressed,
    required this.onMore,
  });

  final Movie movie;
  final VoidCallback onPressed;
  final VoidCallback onMore;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                movie.mainImageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  movie.title,
                  style: theme.textTheme.titleLarge,
                ),
                IconButton(
                  onPressed: onMore,
                  icon: Icon(
                    Icons.more_vert,
                    color: theme.canvasColor,
                  ),
                )
              ],
            ),
            Text(
              'Рейтинг: ${movie.rating}',
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: Colors.yellow[600]),
            ),
          ],
        ),
      ),
    );
  }
}
