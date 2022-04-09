// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:capacitacion_flutter_gran_chapo/src/Utils/Internet.dart';
import 'package:flutter/material.dart';

class LoginServiceView extends StatefulWidget {
  static const String name = 'LoginServiceView';
  const LoginServiceView({Key? key}) : super(key: key);

  @override
  State<LoginServiceView> createState() => _LoginServiceViewState();
}

class _LoginServiceViewState extends State<LoginServiceView> {
  @override
  TextEditingController controllerUsuario = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(body: body());
  }

  Container body() {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(top: 20),
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xffBC1717),
        child: SingleChildScrollView(
          child: Column(children: [
            imagen(size: size, nombreruta: 'icono_s.png'),
            imagen(size: size, nombreruta: 'logox2.png'),
            fieldUser(name: 'Usuario', tipo: false),
            fieldPassword(name: 'Password', tipo: true),
            const Padding(padding: EdgeInsets.all(8.0)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 99, 2, 2),
              ),
              onPressed: () async {
                if (controllerUsuario.text != '' &&
                    controllerPassword.text != '') {
                  final body = {
                    "usr": controllerUsuario.text,
                    "pwd": controllerPassword.text
                  };
                  var response = await Internet.httpPost(
                      url:
                          'https://capacitacion.shalom.com.pe/api/method/login',
                      body: {
                        'usr': controllerUsuario.text,
                        'pwd': controllerPassword.text
                      },
                      seconds: 1);
                  if (response["valor"] != 0) {
                    dialogShow(
                        title: 'En Hora Buena', content: 'Bienvenido');
                  } else {
                    dialogShow(
                        title: 'ERROR', content: 'Usuario no encontrado');
                  }
                } else {
                  dialogShow(
                      title: 'ERROR',
                      content: 'Usuario y Contraseña Incorrectos');
                }
              },
              child: const Text("INGRESAR"),
            )
          ]),
        ));
  }

  Future<dynamic> dialogShow({required String title, required String content}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 99, 2, 2),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  }

  Container imagen({required Size size, required String nombreruta}) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.7,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Image(
            image: AssetImage("assets/images/$nombreruta"),
            fit: BoxFit.scaleDown),
      ),
    );
  }

  Container fieldUser({required String name, required bool tipo}) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(top: 20),
        width: size.width * 0.7,
        child: TextFormField(
          controller: controllerUsuario,
          obscureText: tipo,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            labelText: name,
            //errorText: "$name error",
            labelStyle: TextStyle(color: Colors.white),
            errorStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(),
            /*suffixIcon: Icon(
              Icons.error,
            ),*/
          ),
        ));
  }

  Container fieldPassword({required String name, required bool tipo}) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(top: 20),
        width: size.width * 0.7,
        child: TextFormField(
          controller: controllerPassword,
          obscureText: tipo,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            labelText: name,
            //errorText: "$name error",
            labelStyle: TextStyle(color: Colors.white),
            errorStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(),
            /*suffixIcon: Icon(
              Icons.error,
            ),*/
          ),
        ));
  }
}
