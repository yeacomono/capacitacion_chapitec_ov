import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/Alert-Response.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/Alert-event.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/Alert.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/BotonGeneral.dart';
import 'package:flutter/material.dart';

class AlertsMixin{
 
 AlertEvento alertEvento = new AlertEvento();
 AlertSucces alertSucces = new AlertSucces();
 AlertGeneral alertGeneral = new AlertGeneral();

  modalLoading(context){
    final size = MediaQuery.of(context).size;
    return showDialog(
      barrierDismissible: false,
      context: context, builder: (context){
      return Dialog(
        backgroundColor: Flush.colorGlobal,
        child: Container(
          height: 250,
          width:size.width*0.8,
          child:Image.asset('assets/images/icono_6.png'),
        ),
      );
    });
  }

  modalRespOfRequestService(
    {
      context,
      eventAgree,
      widget,
      title,

    }
  ){
    


  }

  modalError(context){
    final size = MediaQuery.of(context).size;
    return showDialog(
      barrierDismissible: false,
      context: context, builder: (context){
      return Dialog(
        backgroundColor: Flush.colorGlobal,
        child: Container(
          height: 250,
          width:size.width*0.8,
          child: Column(
            children: [
              //Image.asset('assets/images/cat-rainbow.gif'),
              BotonGeneral(
                color: Flush.colorGlobal,
                titlebuton: 'HUBO UN ERROR',
                event: (){
                  Navigator.pop(context);
                }, addIcon: false
              ),
              BotonGeneral(
                color: Flush.colorGlobal,
                titlebuton: 'VERIFIQUE SU CONEXION',
                event: (){
                  Navigator.pop(context);
                }, addIcon: false
              ),
              BotonGeneral(
                color: Flush.colorGlobal,
                titlebuton: 'VERIFIQUE SU USUARIO',
                event: (){
                  Navigator.pop(context);
                }, addIcon: false
              ),
              BotonGeneral(
                color: Flush.colorGlobal,
                titlebuton: 'VERIFIQUE SU PASSWORD',
                event: (){
                  Navigator.pop(context);
                }, addIcon: false
              ),
              BotonGeneral(
                color: Flush.colorGlobal,
                titlebuton: 'INTENTAR DE NUEVO',
                event: (){
                  Navigator.pop(context);
                }, addIcon: false
              )              
            ],
          ),
        ),
      );
    });
  }
}