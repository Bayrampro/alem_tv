import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget {
  const MainAppBar({
    super.key,
  });

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  bool showSearchBar = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      toolbarHeight: 70,
      title: Image.asset(
        'assets/alem_tv_logo.png',
        width: 150,
        height: 40,
      ),
      actions: [
        showSearchBar
            ? Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: IconButton(
                  onPressed: () => setState(() => showSearchBar = false),
                  icon: Icon(
                    Icons.arrow_upward_outlined,
                    color: theme.canvasColor,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: IconButton(
                  onPressed: () {
                    setState(() => showSearchBar = !showSearchBar);
                  },
                  icon: Icon(
                    Icons.search,
                    color: theme.canvasColor,
                    size: 30,
                  ),
                ),
              )
      ],
      bottom: showSearchBar
          ? PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                color: theme.primaryColor,
                child: TextField(
                  style: TextStyle(
                    color: theme.canvasColor,
                    fontSize: 16,
                  ),
                  cursorColor: theme.canvasColor,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    hintText: "Поиск...",
                    hintStyle: TextStyle(
                      color: theme.canvasColor.withOpacity(0.7),
                      fontSize: 16,
                    ),
                    contentPadding: const EdgeInsets.all(16.0),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: theme.canvasColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: theme.canvasColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
