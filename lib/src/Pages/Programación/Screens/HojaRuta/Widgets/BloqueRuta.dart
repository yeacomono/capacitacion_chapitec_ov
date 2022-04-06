import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Bloc/ProgramBloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/Input-global-desing.dart';
import 'package:flutter/material.dart';

class BloqueRuta extends StatefulWidget {
  final bool Inicio;
  final TextEditingController kilometraje;
  final TextEditingController candados;
  final String titleRuta;
  final String choferuno;
  final String choferdos;
  const BloqueRuta({ Key? key,
  required this.Inicio,
  required this.titleRuta,
  required this.choferuno,
  required this.choferdos,
  required this.kilometraje,
  required this.candados }) : super(key: key);

  @override
  _BloqueRutaState createState() => _BloqueRutaState();
}

class _BloqueRutaState extends State<BloqueRuta> {
  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    String month = "${now.year}-${now.month}-${now.day}";
    String hora  = "${now.hour}:${now.minute}:${now.second}";
    return Container(
      margin: EdgeInsets.only(top: 15),
      //color: Colors.deepPurple,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.titleRuta,style: DesingText.sansBoldText(20,Flush.colorTextTitle),),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top:5),
                width: 150,
                  child:listTile(
                  title:Text( 'CHOFER 1',style: DesingText.sansBoldText(15,Flush.tituloItems),),
                  subtitle:Text(widget.choferuno,style: DesingText.regularText(null,Flush.subtituloItems),)
                ),
              ),
              Expanded(child: Container()),
              Visibility(
                visible:
                widget.Inicio? 
                widget.choferuno==ProgramacionBloc.choferInicial:
                widget.choferuno==ProgramacionBloc.choferFinal,
                child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 5, right: 55),
                  decoration: BoxDecoration(
                    color: Flush.rosado,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: EdgeInsets.only(top: 5, bottom: 5,left: 11,right: 11),
                  child: 
                  Text( widget.Inicio? 'INICIA':'FINALIZA',
                    style: DesingText.regularText(10, Colors.white) 
                  )
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top:10),
                width: 150,
                child:listTile(
                  title:Text( 'CHOFER 2',style: DesingText.sansBoldText(15,Flush.tituloItems),),
                  subtitle:Text(widget.choferdos ,style: DesingText.regularText(null,Flush.subtituloItems),)        
                ),
              ),
              Expanded(child: Container()),
              Visibility(
                visible:
                widget.Inicio? 
                widget.choferdos==ProgramacionBloc.choferInicial:
                widget.choferdos==ProgramacionBloc.choferFinal,
                child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 5, right: 55),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: EdgeInsets.only(top: 5, bottom: 5,left: 11,right: 11),
                  child: 
                  Text(widget.Inicio? 'INICIA':'FINALIZA',
                    style: DesingText.regularText(11, Colors.white) 
                  )
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top:10),
            child: Row(
              children: [
                 Expanded(
                   flex: 3,
                  child:listTile(
                   title:Text( 'FECHA',style: DesingText.sansBoldText(15,Flush.tituloItems),),
                   subtitle: Text(month ,style: DesingText.regularText(null,Flush.subtituloItems),)
                 ),
                ),
                 Expanded(
                   flex: 2,
                   child:listTile(
                   title: Text('HORA',style: DesingText.sansBoldText(15,Flush.tituloItems),),
                   subtitle:Text(hora ,style: DesingText.regularText(null,Flush.subtituloItems),),
                 ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:10,bottom:10),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom:10),
                        child: Text('KILOMETRAJE',style: DesingText.sansBoldText(15,Flush.tituloItems),)
                      ),
                      InputGlobalDesing(
                        isOnlyNumber: true,
                        enabled: ProgramacionBloc.Completado,
                        isKM: true,
                        controller: widget.kilometraje,
                        width: 150,                        
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text('CANDADOS',style: DesingText.sansBoldText(15,Flush.tituloItems),)
                      ),
                      InputGlobalDesing(
                        isOnlyNumber: true,
                        enabled: ProgramacionBloc.Completado,    
                        controller:widget.candados ,
                        width: 150,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
    listTile({required Widget title,required Widget subtitle}){
    return Container(
      //padding: EdgeInsets.all(20),
      //color: Colors.amberAccent,
      //width: 300,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          subtitle,
        ],
      )
    );    
  }
}