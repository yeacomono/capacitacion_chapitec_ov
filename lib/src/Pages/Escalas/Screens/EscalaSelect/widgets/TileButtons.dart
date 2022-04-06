import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Bloc/Escala-Select-Bloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Screens/EscalaSelect/widgets/BotonInfo.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/BotonGeneral.dart';
import 'package:flutter/material.dart';

class TileButtonsEscala extends StatelessWidget {
  final bool visibleone;
  final bool visibletwo;
  final String title;
  final String botonOnetitle;
  final String botonTwoTitles;
  final Function() eventOne;
  final Function() eventTwo;
  final bool changebutton;
  final Stream<bool>? streamSecond;
  final Stream<bool>? streamPrymari;
  final String? titleInfo;
  final String? subtitleInfo;
  final String? titleInfo2;
  final String? subtitleInfo2;
  final bool? ini;
  final bool? ini2;
  final bool? botonsecundariobloqueado;
  const TileButtonsEscala(
      {Key? key,
      required this.title,
      required this.botonOnetitle,
      required this.botonTwoTitles,
      required this.eventOne,
      required this.eventTwo,
      this.changebutton = true,
      this.streamSecond, 
      this.streamPrymari, 
      this.titleInfo, 
      this.subtitleInfo, 
      this.titleInfo2, 
      this.subtitleInfo2, 
      this.ini, this.ini2, 
      this.visibleone = true, 
      this.visibletwo = true,
      this.botonsecundariobloqueado
      }
      )
      : super(key: key);
  static final  ScalaSelectBloc escalasSelectBloc =  ScalaSelectBloc();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      //color: Colors.red,
      width: size.width * 0.95,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                title,
                style: DesingText.sansBoldText(14, Flush.colorTextTitle),
              )),
          Row(
            children: [
              Visibility(
                replacement: Expanded(child: SizedBox(),),
                visible: visibleone,
                child: StreamBuilder<bool>(
                  stream: streamPrymari,
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        var now = new DateTime.now();
                        String fecha = "${now.year}-${now.month}-${now.day}";
                        String hora  = "${now.hour}:${now.minute}:${now.second}";
                    var data = snapshot.data??ini!;
                    return Container(
                        child: Expanded(
                          child: data
                              ? BotonGeneral(
                                  borderRaidus: 10,
                                  borderCircle: false,
                                  color: Flush.btngrey,
                                  alignment: Alignment.centerLeft,
                                  sizeTitle: 12,
                                  height: 25,
                                  titlebuton: botonOnetitle,
                                  event: eventOne,
                                  addIcon: true)
                              : BotonInfoRessult(
                                  type: titleInfo??"",
                                  infoType: subtitleInfo==""?"$fecha $hora":subtitleInfo??""
                              )
                        ),
                      );
                  },
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Visibility(
                replacement: Expanded(child: SizedBox(),),
                visible: visibletwo,
                child: StreamBuilder<bool>(
                  stream: streamSecond,
                  builder: (context,AsyncSnapshot<bool> snapshot) {
                        var now = new DateTime.now();
                        String fecha = "${now.year}-${now.month}-${now.day}";
                        String hora  = "${now.hour}:${now.minute}:${now.second}";
                    var data = snapshot.data??ini2!;
                    //var datainicio = ini;
                    return Container(
                      child: Expanded(
                        child: data?BotonGeneral(
                            borderRaidus: 10,
                            borderCircle: false,
                            color: Flush.btnRosado,
                            alignment: Alignment.centerLeft,
                            sizeTitle: 12,
                            height: 25,
                            //width: 200,
                            titlebuton: botonTwoTitles,
                            event: eventTwo,
                            addIcon: true):BotonInfoRessult(
                                  type: titleInfo2??"",
                                  infoType:  subtitleInfo2==""?"$fecha $hora":subtitleInfo2??""),
                      ),
                    );
                  }
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  dialogError(String titulo, String texto, BuildContext context){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(titulo),
        content: Text(texto),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('ok'),
          )
        ],
      )
    );
  }
}
