import 'package:flutter/material.dart';
import 'package:flutter_app_design/config/router/app_router.dart';
import 'package:flutter_app_design/config/theme/app_theme.dart';
import 'package:flutter_app_design/screens/phone_launcher.dart';
import 'package:flutter_app_design/screens/tablet_launcher.dart';

import 'package:flutter_app_design/widgets/background.dart';
import 'package:flutter_app_design/widgets/card_table.dart';
import 'package:flutter_app_design/widgets/custom_bottom_navigation.dart';
import 'package:flutter_app_design/widgets/page_title.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var appTheme = Provider.of<AppTheme>(context).currentTheme;

    final screenSize = MediaQuery.of(context).size;
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        print('screenSize.width');
        print(screenSize.width);
        if (screenSize.width > 500) {
          return TabletLauncher(scaffoldKey: _scaffoldKey, appTheme: appTheme);
        } else {
          return PhoneLauncher(scaffoldKey: _scaffoldKey, appTheme: appTheme);
        }


      },
    );
  }
}

