import 'package:flutter/material.dart';
import 'package:flutter_app_design/screens/basic_design.dart';
import 'package:flutter_app_design/screens/home_screen.dart';
import 'package:flutter_app_design/screens/scroll_design.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(path: '/', builder: (c, s) => HomeScreen()),
  GoRoute(path: '/scroll_screen', builder: (c, s) =>  ScrollScreen()),
  GoRoute(path: '/basic_screen' , builder: (c, s) =>  BasicDesignScreen()),
]);


final pageRoutes =  <_Route>[

  _Route( FontAwesomeIcons.slideshare , 'Slideshow',  HomeScreen() ),
  _Route( FontAwesomeIcons.heading , 'Encabezados',  HomeScreen() ),
  _Route( FontAwesomeIcons.circleNotch , 'Barra Progreso', HomeScreen() ),
  _Route( FontAwesomeIcons.pinterest , 'Pinterest', HomeScreen() ),
  _Route( FontAwesomeIcons.mobile , 'SliversHomeScreenSliverListPage()',HomeScreen() ),

];





class _Route {

  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);

}