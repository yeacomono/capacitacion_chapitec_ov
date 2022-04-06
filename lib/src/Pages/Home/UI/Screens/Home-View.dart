import 'package:capacitacion_flutter_gran_chapo/src/Widgets/Drawer.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/layout-view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static final String name = "HomeView";
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutView(
      drawer:DrawerWidget(),
      titleAppbar: 'Home',
      body: body(), appbar: true);
  }

  body() {
    return Container();
  }
}
