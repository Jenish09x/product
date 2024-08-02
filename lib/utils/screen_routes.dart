import 'package:flutter/material.dart';
import 'package:project/screen/detail/view/detail_screen.dart';
import 'package:project/screen/like/view/like_screen.dart';

import '../screen/home/view/home_screen.dart';

Map<String, WidgetBuilder> screen_routes = {
  '/': (context) => const HomeScreen(),
  'detail': (context) => DetailScreen(),
  'like': (context) => const LikeScreen(),
};
