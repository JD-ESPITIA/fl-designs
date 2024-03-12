import 'package:flutter/material.dart';
import 'package:flutter_app_design/config/router/app_router.dart';
import 'package:flutter_app_design/config/theme/app_theme.dart';

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

    // print('Orientation $orien');

    return Scaffold(
      key: _scaffoldKey,
      drawer: _MenuPrincipal(),
      body: Stack(
        children: [
          // Background
          Background(),
          // Home Body
          _HomeBody()
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            heroTag: '1',
            child: const Icon(Icons.menu),
            backgroundColor: appTheme.hintColor,
            onPressed: () {
              Scaffold.of(context)
                  .openDrawer(); // Utiliza el contexto proporcionado por Builder
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);
    // final accentColor = appTheme.currentTheme.accentColor;
    return Drawer(
      shadowColor: appTheme.currentTheme.hintColor,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    'JD',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
          ),
          const _ListaOpciones(),
          SliverToBoxAdapter(
            child: ListTile(
              leading: const Icon(Icons.lightbulb_outline, color: Colors.blue),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                  value: appTheme.darkTheme,
                  activeColor: Colors.blue,
                  onChanged: (newValue) => appTheme.darkTheme = newValue),
            ),
          ),
          SliverToBoxAdapter(
            child: SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading:
                    const Icon(Icons.add_to_home_screen, color: Colors.blue),
                title: const Text('Custom Theme'),
                trailing: Switch.adaptive(
                    value: appTheme.customTheme,
                    activeColor: Colors.blue,
                    onChanged: (newValue) => appTheme.customTheme = newValue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, i) => ListTile(
          leading: Icon(pageRoutes[i].icon, color: Colors.blue),
          title: Text(pageRoutes[i].titulo),
          trailing: const Icon(Icons.chevron_right, color: Colors.blue),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => pageRoutes[i].page));
          },
        ),
        childCount: pageRoutes.length,
      ),
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

// class _ListaOpciones extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {

//     return CustomScrollView(
//       physics: const BouncingScrollPhysics(),
//       slivers: <Widget>[
//         SliverList(
//           delegate: SliverChildBuilderDelegate(
//             (context, i) => ListTile(
//               leading: FaIcon(
//                 pageRoutes[i].icon,
//                 color: Colors.blue,
//               ),
//               title: Text(pageRoutes[i].titulo),
//               trailing: const Icon(
//                 Icons.chevron_right,
//                 color: Colors.blue,
//               ),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => pageRoutes[i].page,
//                   ),
//                 );
//               },
//             ),
//             childCount: pageRoutes.length,
//           ),
//         ),
//       ],
//     );
//   }
// }
