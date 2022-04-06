// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home2View extends StatefulWidget {
  static const String name = "Home2View";
  const Home2View({Key? key}) : super(key: key);

  @override
  State<Home2View> createState() => _Home2ViewState();
}

class _Home2ViewState extends State<Home2View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Container(
        color: Colors.amberAccent,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    caja(),
                    caja(),
                    caja(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    caja(),
                    caja(),
                    caja(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    caja(),
                    caja(),
                    caja(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container caja() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.all(15),
        child: Text("CAJA"),
        color: Colors.blue,
        width: 80,
        height: 80);
  }
}
