import 'package:capacitacion_flutter_gran_chapo/src/Mixins/AlertsMixin.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Bloc/Escala-Select-Bloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Bloc/Escalas-Bloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Modals/EscalaModel.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Screens/EscalaSelect/EscalaDetail.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Widgets/ListTile-Escala.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Bloc/PaperRuta.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Bloc/ProgramBloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Utils/Colum-Builder.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/Alert.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/layout-view.dart';
import 'package:flutter/material.dart';

ScalaSelectBloc blocEscalaSelec = ScalaSelectBloc();

class EscalasView extends StatelessWidget with AlertGeneral {
  static final String name = "EscalasView";
  const EscalasView({Key? key}) : super(key: key);

  static final EscalasBloc escalasbloc = EscalasBloc();
  static final PaperRutaBLoc _paperRutaBLoc = PaperRutaBLoc();
  static final ScalaSelectBloc _scalaSelectBloc = ScalaSelectBloc();
  @override
  Widget build(BuildContext context) {
    return LayoutView(
        leading: IconButton(onPressed: (){
          
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back),),
        //drawer: DrawerWidget(),
        titleAppbar: 'ESCALAS',
        menuButom: [
          IconButton(
            onPressed: () {
              EscalasBloc.streamListOfEscalas();
              Navigator.pushNamed(context, EscalasView.name,arguments: {}).then((value) => (){});
            },
            icon: Icon(Icons.refresh),
          )
        ],
        body: body(),
        appbar: true);
  }

  Widget body() {
    return Container(
      width: double.infinity,
      child: StreamBuilder<List<EscalaModelCard>>(
        stream: EscalasBloc.escalasStream,
        builder: (BuildContext context,
            AsyncSnapshot<List<EscalaModelCard>> snapshot) {
          List<EscalaModelCard> list = [];
          if (snapshot.data != null) {
            list = snapshot.data!;
            blocEscalaSelec.indexEnd = list.length - 1;
            return ListView(children: [
              ColumnBuilder(
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    var bloq = 0;
                    //print("index $i");
                    if(list[i].estado=='1'){
                      _scalaSelectBloc.unlockProc = false;
                    }else{
                      _scalaSelectBloc.unlockProc = true;
                    }
                    //actualiza el boton de llegada de ruta si se realizo la ultima 
                    //escala
                    if (list[i].estado == "2") {
                      //si ya se inicio la ruta 
                     if(ProgramacionBloc.estadoRutta.estado !="2"){
                        _paperRutaBLoc.addStreamBtnLLega(true);
                     }
                    }
                    // EscalasBloc.setbloqEscala = list[i].estado!;

                    /*if (i != 0) {
                      if (i == list.length - 1) {
                        if (list[i].estado == "1" || list[i].estado == "2") {
                          _paperRutaBLoc.addStreamBtnLLega(true);
                        }
                        print("ultima escala");
                        if (list[i - 1].estado =="1" || list[i-1].estado == "2") {
                          bloq = 0;
                        } else {
                          bloq = 1;
                        }
                      } else {
                        if (list[i - 1].estado == "1" || list[i-1].estado == "2") {
                          bloq = 0;
                        } else {
                          bloq = 1;
                        }
                      }
                      
                    }*/
                    // print("${list[i].estado}");
                    return ListTileEscala(
                        posicionLista: i,
                        estado: list[i].estado,
                        nameEscala: "${i + 1}: ${list[i].nombre}",
                        infoSalida: list[i].fhSalida,
                        infoLLegada: list[i].fhLlegada,
                        eventlaunch: () {
                          _scalaSelectBloc.printBotonesEstado();
                          _scalaSelectBloc.descripcion = list[i].descripcion??"";
                          escalasbloc.escala = list[i];
                          EscalasBloc.idEscala = i;
                          //loadData();
                          print('Navegando hacia Detalla de Escala ${EscalasBloc.idEscala}');
                          EscalasBloc.setnameEscala = list[i].nombre ?? "null";
                          blocEscalaSelec.indexbloc = i;
                          if (i == 0) {
                            Navigator.pushNamed(context, EscalasDetails.name);
                          } else {
                            print('${list[i].estado}+  $bloq + $i');
                            print("esto el bloq$bloq");
                            //if (i == i + bloq) {

                              //if(list[i].estado==1){list[i+1].estado=list[i+1].estado!+1;}
                              
                            //}
                            if(list[i].estado =="0"){
                              _scalaSelectBloc.unlockProc?Navigator.pushNamed(context, EscalasDetails.name):modalProccess(context);
                            }else{
                              Navigator.pushNamed(context, EscalasDetails.name);
                            }
                            
                          }
                        });
                  }),
            ]);
          } else {
            return Center(
              
              child: CircularProgressIndicator(),

            );
          }
        },
      ),
    );
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
              //stream: ProgramacionBloc.getRutaProgramacion,
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
