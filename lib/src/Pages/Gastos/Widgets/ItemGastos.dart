import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Screens/DestinoCantidades/Bloc/DestinBloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Bloc/ProgramBloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Models/Card-Programacion.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Screens/HojaRuta/HojaRutaView.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/Alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListTileGastos extends StatelessWidget with AlertGeneral {
  final String id_chofer;
  final String nombre;
  final String fecha;
  final String monto;
  final String tipo_doc;
  final String serie;
  final String num_doc;
  final String tipo_gasto;
  final String hora;
  final String comprobante;

  const ListTileGastos(
      {Key? key,
      required this.id_chofer,
      required this.nombre,
      required this.fecha,
      required this.monto,
      required this.tipo_doc,
      required this.serie,
      required this.num_doc,
      required this.tipo_gasto,
      required this.hora,
      required this.comprobante})
      : super(key: key);

  static final DestinoCantBloc _destinosCantBloc = DestinoCantBloc();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 0,
      child: Container(
        
        //color: Colors.red,
        width: size.width * 0.95,
        child: containerCard(),
      ),
    );
  }

  modalLaunchCard(context) {
    return showDialogGeneral(context,
        titleDialgo: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('INICIO DE RUTA',
                style: DesingText.regularBoldText(22, Flush.colorTextTitle)),
            StreamBuilder<String>(
              stream: ProgramacionBloc.getRutaProgramacion,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Container(
                  child: Text(snapshot.data ?? "NameRuta",
                      style: DesingText.regularText(12, Flush.tituloItems)),
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
      print('event agreee');
    });
  }

  Widget containerCard() {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xffE6E8EF),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        padding: EdgeInsets.only(top: 15, bottom: 5, right: 15, left: 15),
        
        //height: 155,
        child: Container(
          //color: Colors.red,
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              rigthText(),
              
              lefText(),
            ],
          ),
        ));
  }

  Expanded imageText() {
    return Expanded(
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 0,
            ),
            Container(
              child: CircleAvatar(
                backgroundColor: Flush.colorGlobal,
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                ),
                /* backgroundImage: NetworkImage(
                    'http://165.227.7.113/${perfil.userimage}'
                  ),*/
                radius: 20.0,
              ),
            )
          ],
        ));
  }

  Expanded rigthText() {
    return Expanded(
        flex: 2,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 1, bottom: 10),
                child: Text(
                  tipo_gasto,
                  style: DesingText.sansBoldText(18, Flush.colorTextTitle),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0, bottom: 1),
                child: Text(
                  'HORA',
                  style: DesingText.regularBoldText(
                    13,
                    Flush.tituloItems,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  hora,
                  style: DesingText.regularText(11, Flush.subtituloItems),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 1),
                child: Text(
                  'COMPROBANTE',
                  style: DesingText.regularBoldText(
                    13,
                    Flush.tituloItems,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  comprobante,
                  style: DesingText.regularText(11, Flush.subtituloItems),
                ),
              ),
            ],
          ),
        ));
  }

  Expanded lefText() {
    return Expanded(
        flex: 2,
        child: Container(
            margin: EdgeInsets.only(left: 5),
            //color: Colors.deepOrange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0, bottom: 1),
                  child: Text(
                    id_chofer,
                    style: DesingText.regularBoldText(
                      13,
                      Flush.tituloItems,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          nombre,
                          overflow: TextOverflow.ellipsis,
                          style:
                              DesingText.regularText(11, Flush.subtituloItems),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 1),
                  child: Text(
                    'FECHA',
                    style: DesingText.regularBoldText(
                      13,
                      Flush.tituloItems,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    fecha,
                    style: DesingText.regularText(11, Flush.subtituloItems),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 1),
                  child: Text(
                    'MONTO',
                    style: DesingText.regularBoldText(13, Flush.tituloItems),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'S/. $monto',
                    style: DesingText.regularText(11, Flush.subtituloItems),
                  ),
                ),
              ],
            )));
  }
}
