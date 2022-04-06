import 'package:capacitacion_flutter_gran_chapo/src/Pages/NewHome/widgets/drawer.dart';
import 'package:flutter/material.dart';


class NewHomeView extends StatefulWidget  {
  static const String name = 'NewHomeView';

  const NewHomeView({Key? key}) : super(key: key);
  @override
  _NewHomeViewState createState() => _NewHomeViewState();
}

class _NewHomeViewState extends State<NewHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home View'),
        ),
        drawer: DrawerView(),
    );
  }
}