import 'package:flutter/material.dart';

import 'package:flutter_app_design/widgets/background.dart';
import 'package:flutter_app_design/widgets/card_table.dart';
import 'package:flutter_app_design/widgets/custom_bottom_navigation.dart';
import 'package:flutter_app_design/widgets/page_title.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Background(),
          // Home Body
          _HomeBody()
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(),
   );
  }
}

class _HomeBody extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          // Titulos
          PageTitle(),

          // Card Table
          CardTable(),
        ],
      ),
    );
  }
}