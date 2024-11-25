import 'package:alem_tv/router/router.dart';
import 'package:flutter/material.dart';

import '../ui/ui.dart';

class AlemTVApp extends StatelessWidget {
  const AlemTVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Älem TV',
      debugShowCheckedModeBanner: false,
      theme: theme,
      routerConfig: AppRouter.router,
    );
  }
}
