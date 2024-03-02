import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_design/config/router/app_router.dart';
import 'package:flutter_app_design/config/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light );
    
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: AppTheme().getTheme(),
      routerConfig: appRouter,
      // initialRoute: 'home_screen',
      // routes: {
      //   'basic_design' : ( _ ) => BasicDesignScreen(),
      //   'scroll_screen': ( _ ) => ScrollScreen(), 
      //   'home_screen'  : ( _ ) => HomeScreen(), 
      // },
    );
  }
}