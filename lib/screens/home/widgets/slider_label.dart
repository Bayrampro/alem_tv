import 'package:flutter/material.dart';

class SliderLabel extends StatelessWidget {
  const SliderLabel({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge,
          ),
          TextButton.icon(
            onPressed: onPressed,
            iconAlignment: IconAlignment.end,
            style: TextButton.styleFrom(
              foregroundColor: theme.canvasColor,
            ),
            label: const Text('все'),
            icon: const Icon(Icons.arrow_forward_ios_outlined),
          )
        ],
      ),
    );
  }
}
