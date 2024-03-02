import 'package:flutter_app_design/screens/basic_design.dart';
import 'package:flutter_app_design/screens/home_screen.dart';
import 'package:flutter_app_design/screens/scroll_design.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(path: '/', builder: (c, s) => HomeScreen()),
  GoRoute(path: '/scroll_screen', builder: (c, s) =>  ScrollScreen()),
  GoRoute(path: '/basic_screen' , builder: (c, s) =>  BasicDesignScreen()),
]);