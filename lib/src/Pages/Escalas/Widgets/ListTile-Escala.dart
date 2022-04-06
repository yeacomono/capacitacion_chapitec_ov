import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Bloc/Escala-Select-Bloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Bloc/Escalas-Bloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListTileEscala extends StatelessWidget {
  final int? posicionLista;
  final String? infoSalida;
  final String? infoLLegada;
  final String? nameEscala;
  final String? estado;
  final Function() eventlaunch;

  const ListTileEscala({
    Key? key,
    this.posicionLista,
    this.estado,
    this.infoSalida,
    this.infoLLegada,
    required this.eventlaunch,
    this.nameEscala,
  }) : super(key: key);

  static final ScalaSelectBloc _scalaSelectBloc = ScalaSelectBloc();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(8),
      child: Slidable(
      /// enabled:  _scalaSelectBloc.unlockProc,
       // enabled:  estado != '0' ? true : false,
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: '',
            iconWidget: Icon(
              Icons.car_rental,
              size: 70,
              color: Colors.white,
            ),
            color: Colors.green,
            onTap: eventlaunch,
          ),
        ],
        actionPane: SlidableDrawerActionPane(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          //color: Flush.listTileFond,
          decoration: decoration(),
          width: size.width * 0.95,
          child: InkWell(
            //onTap: ,
            child: Row(
              children: [
                Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nameEscala ?? 'Escala',
                          style: DesingText.regularBoldText(
                              15.5, Flush.colorTextTitle),
                        ),
                        infoLLegada == ""
                            ? Container(
                                height: 50,
                              )
                            : fechaDetail(
                                infoLLegada ?? "", Colors.green, "LLEGADA:"),
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      estadoDetail(
                          //COMPROBACION DE LOS 3 ESTADOS
                          estado == '0'
                              ? 'PENDIENTE'
                              : estado == '1'
                                  ? 'EN CURSO'
                                  : 'COMPLETADO',
                          estado == '0'
                              ? Flush.rosado
                              : estado == '1'
                                  ? Flush.colorGlobal
                                  : Colors.green),
                      infoSalida == ""
                          ? Container(
                              height: 50,
                            )
                          : fechaDetail(
                              infoSalida ?? "", Flush.colorGlobal, "SALIDA:"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  estadoDetail(String fecha, Color color) {
    return Container(
        margin: EdgeInsets.only(top: 0, bottom: 0),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: Text(
          fecha,
          style: DesingText.regularText(12, Colors.white),
        ));
  }

  fechaDetail(String fecha, Color color, String tipo) {
    return Container(
        margin: EdgeInsets.only(top: 20, bottom: 5),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Text(
          tipo + fecha,
          style: DesingText.regularText(9, Colors.white),
        ));
  }

  decoration() {
    return BoxDecoration(
        color:
            estado != '0' ? Flush.listTileFond : Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(0));
  }
}
