import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Escalas-view.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Screens/DestinoCantidades/DestinoCantidades.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Screens/EscalaSelect/EscalaDetail.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Screens/SelecCargo/SelectCargo.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Gastos/Relevos-View.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Gastos/Screens/ListGastos-View.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Home/UI/Screens/Home-View.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Home2/home2.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Login/Models/UserData.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Login/Screens/Login-View.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/LoginService/loginservice_view.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/NewHome/newhome.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Perfil/Perfil-View.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Screens/HojaRuta/HojaRutaView.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Program-View.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Relevos/Relevos-View.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/VistaUno/itemone.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/vistaTwo/vistatwo.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static Map<String, WidgetBuilder> rutes = {
    // LoginView.name         :(context)=>LoginView(),
    //HomeView.name          :(context)=>HomeView(),
    NewHomeView.name: (context) => const NewHomeView(),
    VistaOne.name: (context) => const VistaOne(),
    VistaTwo.name: (context) => const VistaTwo(),
    Home2View.name: (context) => const Home2View(),
    LoginServiceView.name: (context) => const LoginServiceView(),

    // PerfilView.name        :(context)=>PerfilView(),
    // ProgramcionView.name   :(context)=>ProgramcionView(),
    // EscalasView.name       :(context)=>EscalasView(),
    // HojaRutaView.name      :(context)=>HojaRutaView(),
    // RelevosView.name       :(context)=>RelevosView(),
    // EscalasDetails.name    :(context)=>EscalasDetails(),
    // DestinoEnvio.name      :(context)=>DestinoEnvio(),
    // GasstosView.name        :(context)=>GasstosView(),
    // Selectcargo.name        :(context)=>Selectcargo(),
    // GasstosListView.name      :(context)=>GasstosListView()
  };
}
