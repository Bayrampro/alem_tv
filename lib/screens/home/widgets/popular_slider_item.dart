import 'package:flutter/material.dart';

class PopularMoviesSliderItem extends StatelessWidget {
  const PopularMoviesSliderItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.onTap,
  });

  final String imageUrl;
  final String title;
  final double rating;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 240,
              height: 310,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              title,
              style: theme.textTheme.titleMedium,
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                ),
                Text(
                  '$rating / ',
                  style: TextStyle(color: theme.canvasColor),
                ),
                const Text(
                  'Бесплатно',
                  style: TextStyle(color: Colors.green),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
