import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:flutter/material.dart';

class CabezalDrawer extends StatefulWidget {
  const CabezalDrawer({Key? key}) : super(key: key);

  @override
  _CabezalDrawerState createState() => _CabezalDrawerState();
}

class _CabezalDrawerState extends State<CabezalDrawer> {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Flush.colorGlobal,
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.only(right: 35.0, bottom: 30.0),
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Image.asset('assets/images/logo.png'),
            height: 50.0,
          ),
        ],
      ),
    );
  }

  Widget textDrawerHead(String text, double size) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: Colors.white,
      ),
    );
  }
}
