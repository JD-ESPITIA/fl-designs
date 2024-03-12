import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_design/config/router/app_router.dart';
import 'package:flutter_app_design/config/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(create: (_) => AppTheme(2),
  child: MyApp(), )
  );
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light );
    final appCurrentTheme = Provider.of<AppTheme>(context).currentTheme;


    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: appCurrentTheme,
      // theme: AppTheme().getTheme(),
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