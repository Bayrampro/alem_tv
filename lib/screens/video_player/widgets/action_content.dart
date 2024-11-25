import 'package:flutter/material.dart';

class ActionContent extends StatelessWidget {
  const ActionContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.black.withOpacity(0.9),
      width: mediaQuery.size.width,
      height: mediaQuery.size.height * 0.35,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.share,
              color: theme.canvasColor,
              size: 30,
            ),
            title: Text('Поделиться', style: theme.textTheme.titleLarge),
          ),
          const Divider(thickness: 0.5),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.bookmark_outline,
              color: theme.canvasColor,
              size: 30,
            ),
            title: Text('Смотреть позже', style: theme.textTheme.titleLarge),
          ),
          const Divider(thickness: 0.5),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.flag_outlined,
              color: theme.canvasColor,
              size: 30,
            ),
            title: Text(
              'Пожаловатья на фильм',
              style: theme.textTheme.titleLarge,
            ),
          ),
          const Divider(thickness: 0.5),
        ],
      ),
    );
  }
}
