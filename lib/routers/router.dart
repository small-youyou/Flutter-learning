// import 'dart:js';

// import 'dart:js';

import 'package:flutter/material.dart';
import '../pages/tabs/Tabs.dart';
import '../pages/Login.dart';
import '../pages/tags/TagChipDemo.dart';
import '../pages/tags/TagTextFieldDemo.dart';

//配置路由
final routes = {
  '/': (context) => Tabs(),
  '/login': (context) => LoginPage(),
  '/initTags': (context) => TagChipDemo(),
  '/inputNewTag': (context) => TextFieldDemo(),
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
// 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
