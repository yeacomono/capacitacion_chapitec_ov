import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Screens/DestinoCantidades/Bloc/DestinBloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Bloc/ProgramBloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Models/Card-Programacion.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Screens/HojaRuta/HojaRutaView.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/Alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlideListTile extends StatelessWidget with AlertGeneral {
  final List<String> destinosNombre;
  final String? choferInicial;
  final String? choferFinal;
  final String idcarGroup;
  final String ruta;
  final String origen;
  final String destino;
  final String ChoferOne;
  final String ChoferTwo;
  final String fecha;
  final String placa;
  final String codigo;
  final EstadoRuta estadoRuta;
  final int  bloqueoTap;
  final bool  lockSlidable;
  const SlideListTile(

      {Key? key,
      required this.choferFinal,
      required this.choferInicial,
      required this.ChoferTwo,
      required this.ChoferOne,
      required this.ruta,
      required this.origen,
      required this.destino,
      required this.fecha,
      required this.placa,
      required this.codigo,
      required this.idcarGroup,
      required this.destinosNombre,
      required this.estadoRuta, 
      required this.bloqueoTap,
      required this.lockSlidable
      }
      )
      : super(key: key);

  static final DestinoCantBloc _destinosCantBloc = DestinoCantBloc();
  static final now = new DateTime.now(); 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 0,
      child: Container(
        //color: Colors.red,
        width: size.width * 0.8,
        child: Stack(
          children: [
            Slidable(
              enabled:lockSlidable,
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: containerSlidable(),
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: '',
                  iconWidget: Icon(
                    Icons.car_rental,
                    size: 70,
                    color: Colors.white,
                  ),
                  color: Colors.green,
                  onTap: bloqueoTap==0?() {

                    ProgramacionBloc.setIdcar = idcarGroup;
                    ProgramacionBloc.setRutaName = ruta;
                    ProgramacionBloc.estadoRutta = estadoRuta;
                    ProgramacionBloc.choferOne = ChoferOne;
                    ProgramacionBloc.choferTwo = ChoferTwo;
                    ProgramacionBloc.fechaFin = estadoRuta.fechaArrive??'$now';
                    ProgramacionBloc.choferInicial = choferInicial??'';
                    ProgramacionBloc.choferFinal = choferFinal??'';
                    
                    // Comprobacion para bloquear todos los campos si ya se completo la ruta
                    // esta al revez porque asi lo requiere el 'enabled'

                    if(estadoRuta.estado =='2'){
                      
                      ProgramacionBloc.Completado = false;

                    }else{

                      ProgramacionBloc.Completado = true;

                    }


                    if(estadoRuta.estado== "0"){
                      !ProgramacionBloc.bloqProcess?modalLaunchCard(context):modalProccess(context);
                    }else{
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> HojaRutaView()));
                      Navigator.pushNamed(context,HojaRutaView.name);
                    }
                  }:null,
                ),
              ],
            ),
            Visibility(
              visible:!lockSlidable,
              child: Container(
                height: 180,
                width:double.infinity,
                color: Colors.white.withOpacity(0.5),
              ),
            )
          ],
        ),
      ),
    );
  }

  modalLaunchCard(context) {
    return showDialogGeneral(context,
        titleDialgo: Column(
          children: [
            Text(
              'INICIO DE RUTA',
              style: DesingText.regularBoldText(22, Flush.colorTextTitle)
            ),
            StreamBuilder<String>(
              stream: ProgramacionBloc.getRutaProgramacion,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Container(
                  child: Text(
                    snapshot.data ?? "NameRuta",
                    style: DesingText.regularText(12, Flush.tituloItems)
                  ),
                );
              },
            ),
          ],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Al ingresar se dará el inicio de la ruta, grabando la fecha y hora, esto no se podrá cambiar o borrar.",
                style: DesingText.sansBoldText(14, Flush.colorTextTitle),
                textAlign: TextAlign.center,
              ),
              Text(
                'Esta seguro de iniciar la ruta?',                
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ), eventAgree: () {
      _destinosCantBloc.setDestino = destinosNombre;
      Navigator.pop(context);
      //Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushNamed(context, HojaRutaView.name);
      print('Ejecutando Evento de Aceptacion');
    });
  }

  Widget containerSlidable() {
    return Container(
        color: Color(0xffE6E8EF),
        padding: EdgeInsets.only(top: 10, bottom: 20,right: 20, left: 20),
        width: double.infinity,
        height: 180,
        child: Container(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          child: Row(
            children: [
              lefText(),
              rigthText(),
            ],
          ),
        ));
  }

  Expanded rigthText() {
    return Expanded(
        flex: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              fecha,
              textAlign: TextAlign.end,
              style: DesingText.sansBoldText(15, Flush.tituloItems),
            ),
            Expanded(child: SizedBox()),            
            EstadoProgramacion(),
            //Text('$choferInicial'),
            Container(
              padding: EdgeInsets.only(right: 5),
              alignment: Alignment.centerRight,
              //color: Colors.red,
              width: double.infinity,
              child: Text(
                codigo,
                style: DesingText.sansBoldText(12, Flush.colorTextTitle),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 3),
                decoration: BoxDecoration(
                    color: Flush.rosado,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.only(top: 8, bottom: 8,left: 16,right: 16),
                child: Text(placa,
                    style: DesingText.regularText(13, Colors.white))),
          ],
        ));
  }

  EstadoProgramacion(){
    return Container(
      //estadoRuta!=null
      child: lockSlidable? Container(
        margin: EdgeInsets.only(top: 3, bottom: 8),
        decoration: BoxDecoration(
          color: 
          estadoRuta.estado=='0'?Flush.rosado:
          estadoRuta.estado=='1'?Flush.colorGlobal:
          Colors.green,
          borderRadius: BorderRadius.circular(10)
        ),
          padding: EdgeInsets.only(top: 5, bottom: 5,left: 11,right: 11),
          child: 
          // triple if para saber en que estado esta
          // COMPLETADO - EN PROCESO - PENDIENTE 
        estadoRuta.estado=='0'?Text( 'PENDIENTE',
          style: DesingText.regularText(10, Colors.white)
        ):
        estadoRuta.estado=='1'?Text( 'EN PROCESO',
          style: DesingText.regularText(10, Colors.white) ):
          Text( 'COMPLETADO',
            style: DesingText.regularText(10, Colors.white) )
      ):
      Container(
        margin: EdgeInsets.only(top: 3, bottom: 8),
        decoration: BoxDecoration(
          color: Flush.rosado,
          borderRadius: BorderRadius.circular(10)
        ),
          padding: EdgeInsets.only(top: 5, bottom: 5,left: 11,right: 11),
          child: 
          Text( 'BLOQUEADO',
            style: DesingText.regularText(10, Colors.white) )
      ),
    );
  }

  Expanded lefText() {
    return Expanded(
        flex: 5,
        child: Container(
            //color: Colors.deepOrange,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(top: 0, bottom: 5),
              child: Text(
                ruta,
                style: DesingText.regularBoldText(18, Flush.colorTextTitle),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 0),
              child: Text(                
                'ORIGEN',
                style: DesingText.regularBoldText(15, Flush.tituloItems,),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 6),
              child: Text(
                origen,
                style: DesingText.regularText(14, Flush.subtituloItems),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 0),
              child: Text(
                'DESTINO',
                style: DesingText.regularBoldText(15, Flush.tituloItems),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text(
                destino,
                style: DesingText.regularText(14, Flush.subtituloItems),
              ),
            ),
          ],
        )));
  }

  modalProccess(BuildContext context) {
    return showDialogGeneral(context,
        titleDialgo: Column(
          children: [
            Text(
              'INICIO DE RUTA',
              style: DesingText.regularBoldText(22, Flush.colorTextTitle)
            ),
            StreamBuilder<String>(
              stream: ProgramacionBloc.getRutaProgramacion,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Container(
                  child: Text(
                    snapshot.data ?? "NameRuta",
                    style: DesingText.regularText(12, Flush.tituloItems)
                  ),
                );
              },
            ),
          ],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Usted no podra acceder, por favor termine de la ruta en estado de proceso para poder acceder a esta ruta.",
                style: DesingText.sansBoldText(14, Flush.colorTextTitle),
                textAlign: TextAlign.center,
              ),
              Text(
                'Vuelva cuando finalice.',                
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ), eventAgree: () {
      //_destinosCantBloc.setDestino = destinosNombre;
      Navigator.pop(context);
      //Navigator.of(context).popUntil((route) => route.isFirst);
      //Navigator.pushNamed(context, HojaRutaView.name);
      //print('Ejecutando Evento de Aceptacion');
    });    
  }
}
