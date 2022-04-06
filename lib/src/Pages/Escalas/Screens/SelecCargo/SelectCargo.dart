import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Bloc/Escala-Select-Bloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Screens/EscalaSelect/widgets/Body-Desembarque.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/layout-view.dart';
import 'package:flutter/material.dart';
typedef StringValue = String Function(String);

 class Selectcargo extends StatefulWidget {
   static final String name = "Selectcargo";
   const Selectcargo({ Key? key}) : super(key: key);
    static final ScalaSelectBloc scalaSelectBloc =  ScalaSelectBloc();

  @override
  _SelectcargoState createState() => _SelectcargoState();
}

class _SelectcargoState extends State<Selectcargo> {
  String name ="";
   @override
   Widget build(BuildContext context) {
     return LayoutView(
       leading: IconButton(
         onPressed: (){
            textDynamicOfSelectCargo();
            Navigator.pop(context);
         },
         icon: Icon(Icons.arrow_back),
       ),
       body: body(),
       titleAppbar: "SELECCIONE CARGO",
       appbar: true,

      );
   }

  body() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Container(child: BodyDesembarqueAlert()) ,
      ),
    );
  }

  textDynamicOfSelectCargo(){
    if(
      Selectcargo.scalaSelectBloc.getGuias||
      Selectcargo.scalaSelectBloc.getbolsas||
      Selectcargo.scalaSelectBloc.getgiros||
      Selectcargo.scalaSelectBloc.getpaqueterias

    ){
       var gui = Selectcargo.scalaSelectBloc.getGuias?"Guias":"";
       var paque = Selectcargo.scalaSelectBloc.getpaqueterias?"Paqueterias":"";
       var giro = Selectcargo.scalaSelectBloc.getgiros?"Giros":"";
       var bolsa = Selectcargo.scalaSelectBloc.getbolsas?"Bolsas":"";
       name = "$bolsa $gui  $giro $paque";
     Selectcargo.scalaSelectBloc.selectCargo.sink.add(name);
    //  return  name;
    }else{
      Selectcargo.scalaSelectBloc.selectCargo.sink.add("SELECCIONE CARGO");
    }
  }
}