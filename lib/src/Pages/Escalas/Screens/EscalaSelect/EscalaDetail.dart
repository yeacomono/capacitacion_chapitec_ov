import 'dart:async';

import 'package:capacitacion_flutter_gran_chapo/src/Mixins/AlertsMixin.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Bloc/Escala-Select-Bloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Bloc/Escalas-Bloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Screens/DestinoCantidades/DestinoCantidades.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Screens/EscalaSelect/widgets/TileButtons.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Screens/SelecCargo/SelectCargo.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Services/Escala-Details.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Bloc/ProgramBloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/BotonGeneral.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/BoxInfo.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/Input-global-desing.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/TileInput.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/layout-view.dart';
import 'package:flutter/material.dart';

class EscalasDetails extends StatefulWidget{
  static final String name = "EscalasDetails";
  static final now = new DateTime.now();
  static final String fecha = "${now.year}/${now.month}/${now.day}";
  static final String hora  = "${now.hour}:${now.minute}";

  const EscalasDetails({Key? key}) : super(key: key);

  @override
  _EscalasDetailsState createState() => _EscalasDetailsState();
}

class _EscalasDetailsState extends State<EscalasDetails>   with AlertsMixin{
  TextEditingController kilometrajeInit =  TextEditingController();
  TextEditingController kilometrajeEnd =  TextEditingController();
  EscalaDetailsService service = EscalaDetailsService();
  ScalaSelectBloc scalaSelectBloc = ScalaSelectBloc();
  TextEditingController descriptionContollee =  TextEditingController();
  EscalasBloc escalasbloc = EscalasBloc();
   bool changeloading = false;
   String selecCargo = "SELECCIONE CARGO";



@override
  void initState() {
    descriptionContollee.text = scalaSelectBloc.descripcion;
    print("objecswrgsrgsdrgrst");
    super.initState();
    //loadData();
    if( escalasbloc.escala.fhSalida!=""){
      scalaSelectBloc.salida=true;
    }
        if( escalasbloc.escala.fhLlegada!=""){
      scalaSelectBloc.llegada=true;
    }
        if( escalasbloc.escala.fhEmbIni!=""){
      scalaSelectBloc.initembarque=true;
    }
        if( escalasbloc.escala.fhEmbFin!=""){
      scalaSelectBloc.endembarque=true;
    }
        if( escalasbloc.escala.fhDesmbIni!=""){
      scalaSelectBloc.initdesembarque=true;
    }
        if( escalasbloc.escala.fhDesmbFin!=""){
      scalaSelectBloc.enddesembarque=true;
    }
    print(escalasbloc.escala.fhSalida);
    print( scalaSelectBloc.salida);
  }
  @override
  Widget build(BuildContext context) {

  
    return LayoutView(
        leading: !changeloading?IconButton(onPressed: ()async{

          scalaSelectBloc.restoreBotonStado();
          scalaSelectBloc.printBotonesEstado();
          scalaSelectBloc.resetCargoValores();

          scalaSelectBloc.setIdesc ="";

          setState(() {

            changeloading = true;

          });

         await EscalasBloc.streamListOfEscalas();
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back),):Padding(
          padding: const EdgeInsets.all(18.0),
          child: CircularProgressIndicator(color: Colors.white,),
        ),


        titleAppbar: "ESCALA : ${EscalasBloc.getnameEscala}",
        body: body(context),
        appbar: true
      );
  }
  
/*  textDynamicOfSelectCargo(){

   
    if(
      scalaSelectBloc.getGuias||
      scalaSelectBloc.getbolsas||
      scalaSelectBloc.getgiros||
      scalaSelectBloc.getpaqueterias

    ){
       var gui = scalaSelectBloc.getGuias?"Guias":"";
       var paque = scalaSelectBloc.getpaqueterias?"Paqueterias":"";
       var giro = scalaSelectBloc.getgiros?"Giros":"";
       var bolsa = scalaSelectBloc.getbolsas?"Bolsas":"";
       setState(() {
         selecCargo = "$gui $bolsa $giro $paque";
       });
      return  selecCargo;
    }else{
      return selecCargo;
    }
    
  }*/

  body(context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
          //color: Colors.black,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TileButtonsEscala(
                visibletwo: scalaSelectBloc.indexbloc == scalaSelectBloc.indexEnd?false:true,
                visibleone: scalaSelectBloc.indexbloc==0?false:true,
                ini:escalasbloc.escala.fhLlegada == ""?true:false,
                ini2:escalasbloc.escala.fhSalida == ""?true:false, 
                titleInfo: "REGISTRE LLEGADA",
                subtitleInfo: scalaSelectBloc.fechaL==""?escalasbloc.escala.fhLlegada:scalaSelectBloc.fechaL,
                titleInfo2: "REGISTRE SALIDA",
                subtitleInfo2: scalaSelectBloc.fechaS==""?escalasbloc.escala.fhSalida:scalaSelectBloc.fechaS,
                streamPrymari: scalaSelectBloc.sLLegada,
                streamSecond: scalaSelectBloc.sShaldia,
                title: 'LLEGADA/SALIDA',
                botonOnetitle: 'REGISTRE LLEGADA',
                botonTwoTitles: 'REGISTRE SALIDA',
                eventOne: () {
                      scalaSelectBloc.indexbloc!=0?alertGeneral.showDialogGeneral(
                      context,
                       stream: scalaSelectBloc.serRegSalida,
                       streamtext: scalaSelectBloc.smsnvalidation,
                      titleDialgo: Text("REGISTRO DE LLEGADA",style: DesingText.sansBoldText(20,Flush.colorTextTitle),),
                      body: cuerpo(kilometrajeInit),
                      eventAgree:()async{
                      var response = await service.registerllegada(
                         idcargrupo:ProgramacionBloc.getIdcar,
                         kilometraje:kilometrajeInit.text,
                         nombreesc: EscalasBloc.getnameEscala
                       );
                      if(response["valor"]==1){
                        setState(() {
                           scalaSelectBloc.salida  = true;
                        });
                        } 
                      }
                   ):print("Llegada Boton Bloqueado");
                },
                eventTwo: () {
                  if(scalaSelectBloc.salida|| EscalasBloc.idEscala ==0){
                    alertGeneral.showDialogGeneral(
                      context,
                      stream: scalaSelectBloc.serRegSalida,
                      streamtext: scalaSelectBloc.smsnvalidation,
                      titleDialgo: 
                        Text(
                          "REGISTRO DE SALIDA", 
                          style: DesingText.sansBoldText(20,Flush.colorTextTitle),
                          ),
                      body:cuerpo(kilometrajeEnd),
                      eventAgree:()async{
                       scalaSelectBloc.trySerRegSalida.sink.add(0);
                       Timer(Duration(seconds: 1), ()async{
                       var response = await service.registersalida(
                         nombreesc: EscalasBloc.getnameEscala,
                         idcargrupo:ProgramacionBloc.getIdcar,
                         idesc: scalaSelectBloc.getIdesc==""?escalasbloc.escala.idEsc:scalaSelectBloc.getIdesc,
                         kilometraje:kilometrajeEnd.text,

                       );
                        if(response["valor"]==1){
                        setState(() {
                           scalaSelectBloc.salida  = true;
                        });
                        }
                       });

                      }
                    );
                  }else{
                    dialogError('LLEGADA Y SALIDA', 'Tiene que registrar una salida antes.', context);
                  }
                    
                },
            ),
              TileButtonsEscala(
                ini:escalasbloc.escala.fhEmbIni == ""?true:false,
                ini2:escalasbloc.escala.fhEmbFin == ""?true:false, 
                titleInfo: "INICIO EMBARQUE",
                subtitleInfo: scalaSelectBloc.fechaIE==""?escalasbloc.escala.fhEmbIni:scalaSelectBloc.fechaIE,
                subtitleInfo2: scalaSelectBloc.fechaLEE==""?escalasbloc.escala.fhEmbFin:scalaSelectBloc.fechaLEE,
                titleInfo2: "FIN DESEMBARQUE",
                streamPrymari:scalaSelectBloc.schangeInitEmbarque,
                streamSecond: scalaSelectBloc.schangeEndEmbarque,
                title: 'EMBARQUE',
                botonOnetitle :'INICIO DE EMBARQUE',

                botonTwoTitles:'FIN DE EMBARQUE',
                eventOne: () {
                    scalaSelectBloc.initembarque = true;
                    scalaSelectBloc.endembarque  = false;
                    alertGeneral.showDialogGeneral(
                      context,
                      height: 220,
                      body: fechaHora(),
                       stream: scalaSelectBloc.serRegSalida,
                       streamtext: scalaSelectBloc.smsnvalidation,
                      titleDialgo: Text("INICIO DE EMBARQUE",style: DesingText.sansBoldText(20,Flush.colorTextTitle),),
                      eventAgree:()async{
                        scalaSelectBloc.trySerRegSalida.sink.add(0);
                       var respponse =  await service.initEmbarque(scalaSelectBloc.getIdesc==""?escalasbloc.escala.idEsc:scalaSelectBloc.getIdesc);
                       if(respponse["valor"]==1){
                         setState(() {
                           scalaSelectBloc.initembarque = true;
                         });
                       }
                      }
                    );
                },
                eventTwo: () {
                  if(escalasbloc.escala.fhEmbIni != ""){
                      alertGeneral.showDialogGeneral(
                      context,
                      height: 220,
                       stream: scalaSelectBloc.serRegSalida,
                       streamtext: scalaSelectBloc.smsnvalidation,
                      body:fechaHora(),
                      titleDialgo: Text("FIN DE EMBARQUE",style: DesingText.sansBoldText(20,Flush.colorTextTitle),),
                      eventAgree:()async{
                        scalaSelectBloc.trySerRegSalida.sink.add(0);
                       var response = await service.endEmbarque(scalaSelectBloc.getIdesc==""?escalasbloc.escala.idEsc:scalaSelectBloc.getIdesc);
                        if(response["valor"]==1){
                        setState(() {
                           scalaSelectBloc.endembarque  = true;
                        });
                        }
                      }
                    );
                  }else{
                    dialogError('EMBARQUE', 'Tiene que registrar un inicio embarque antes.', context);
                  }
                                        
                },
            ),
                TileButtonsEscala(
                ini:escalasbloc.escala.fhDesmbIni == ""?true:false,
                ini2:escalasbloc.escala.fhDesmbFin == ""?true:false, 
                titleInfo: "INICIO DESEMBARQUE",
                titleInfo2: "FUIN DESEMBARQUE",
                subtitleInfo2: scalaSelectBloc.fechaLID==""?escalasbloc.escala.fhDesmbIni:scalaSelectBloc.fechaLID,
                subtitleInfo: scalaSelectBloc.fechaLED==""?escalasbloc.escala.fhDesmbFin:scalaSelectBloc.fechaLED,  
                streamPrymari: scalaSelectBloc.schaninidesembarque,
                streamSecond: scalaSelectBloc.schngeEndDesembarque,
                title: 'DESEMBARQUE',
                botonOnetitle: 'INICIO DESEMBARQUE',
                botonTwoTitles: 'FIN DESEMBARQUE',
                eventOne: () {
                    alertGeneral.showDialogGeneral(
                      context,
                      height: 220,
                       stream: scalaSelectBloc.serRegSalida,
                       streamtext: scalaSelectBloc.smsnvalidation,
                      body: fechaHora(),
                      titleDialgo: Text("INICIO DESEMBARQUE",style: DesingText.sansBoldText(20,Flush.colorTextTitle),),
                      eventAgree:()async{
                        scalaSelectBloc.trySerRegSalida.sink.add(0);
                        var response = await service.initDesembarque(scalaSelectBloc.getIdesc==""?escalasbloc.escala.idEsc:scalaSelectBloc.getIdesc);
                                                if(response["valor"]==1){
                        setState(() {
                           scalaSelectBloc.initdesembarque  = true;
                        });
                        }
                      },
                      
                    );
                },
                eventTwo: () {
                  if(escalasbloc.escala.fhDesmbIni != ""){
                    alertGeneral.showDialogGeneral(
                      context,
                       stream: scalaSelectBloc.serRegSalida,
                       streamtext: scalaSelectBloc.smsnvalidation,
                      body:fechaHora(),
                      titleDialgo: Text("FIN DESEMBARQUE",style: DesingText.sansBoldText(20,Flush.colorTextTitle),),
                      eventAgree:()async{
                        scalaSelectBloc.trySerRegSalida.sink.add(0);
                        var response = await service.endDesmbarque( scalaSelectBloc.getIdesc==""?escalasbloc.escala.idEsc:scalaSelectBloc.getIdesc,);
                        if(response["valor"]==1){
                        setState(() {
                           scalaSelectBloc.enddesembarque  = true;
                        });
                        }
                      },
                      height: 220,
                    ); 
                  }else{
                    dialogError('DESEMBARQUE', 'Tiene que registrar un inicio de desembarque', context);
                  }
                                         
                },
            ),
            SizedBox(height: 5,),
            description(context),
            StreamBuilder<String>(
              stream: scalaSelectBloc.sselectCargo,
              initialData: "SELECCIONE CARGO",
              builder: (context,AsyncSnapshot<String> snapshot) {
                return BotonGeneral(
                  borderCircle: true,
                  borderRaidus: 9.0,              
                  color: Colors.blueGrey.shade50,
                  colorIcon: Flush.colorGlobal,
                  colortext: Flush.colorGlobal,
                  alignment: Alignment.centerLeft,
                  titlebuton: snapshot.data,
                  width: size.width*0.9,
                  event: (){
                    if(ProgramacionBloc.Completado){
                      Navigator.pushNamed(context, Selectcargo.name);
                    }else{
                      dialogError('No puede cambiar este campos', 'Ya se termino la programacion', context);
                    }
                  }, addIcon: true
                );
              }
            ),
            Container(height: 20),
            BotonGeneral(
              height: 30,
              borderCircle: true,
              borderRaidus: 9.0,
              color: Colors.blueGrey.shade50,
              colorIcon: Flush.colorGlobal,
              colortext: Flush.colorGlobal,
              alignment: Alignment.centerLeft,
              titlebuton:"DESTINO Y CANTIDADES",
              width: size.width*0.9,
              event: (){
                if(ProgramacionBloc.Completado){
                   //if(!scalaSelectBloc.destinoCant){
                print('navegando hacia destinos y envios');
                Navigator.pushNamed(context, DestinoEnvio.name);                  
               // }
                }else{
                  dialogError('No puede cambiar este campos', 'Ya se termino la programacion', context);
                }
               
              }, addIcon: false
            ),
            Container(height: 20),
            BotonGeneral(
              height: 30,
              borderCircle: true,
              borderRaidus: 8.0,
              color: Flush.colorGlobal,
              width: size.width*0.9,
              titlebuton: "SOLICITAR CONFORMIDAD",
              event: ()async{
                alertGeneral.showDialogGeneral(
                      context,
                       stream: scalaSelectBloc.serRegSalida,
                       streamtext: scalaSelectBloc.smsnvalidation,
                     
                      titleDialgo: Text("SOLICITAR CONFORMIDAD",style: DesingText.sansBoldText(20,Flush.colorTextTitle),),
                      body: Text("¿SEGURO QUE DESEA SOLICITAR CONFORMIDAD?",style: DesingText.regularBoldText(15,Flush.colorTextsubtitle),),
                      eventAgree:()async{ 
                        // si ya se completo la programacion
                        if(ProgramacionBloc.Completado){
                            setState(() {
                              print(scalaSelectBloc.enddesembarque);
                            });
                          if(scalaSelectBloc.initembarque&&!scalaSelectBloc.endembarque){
                            alertEvento.mostrarCuadro(context, texto: "Verifique si termino embarque");
                          }else if(scalaSelectBloc.initdesembarque&&!scalaSelectBloc.enddesembarque){
                            alertEvento.mostrarCuadro(context, texto: "Verifique si termino desembarque");
                          }else if(
                            scalaSelectBloc.initembarque&&
                            scalaSelectBloc.endembarque&&
                            scalaSelectBloc.initdesembarque&&
                            scalaSelectBloc.enddesembarque
                          ){
                            await service.sendDescriptionAndCargo(
                            context:context,
                            idesc: scalaSelectBloc.getIdesc==""?escalasbloc.escala.idEsc:scalaSelectBloc.getIdesc, 
                            bolsas: scalaSelectBloc.getbolsas, 
                            guias: scalaSelectBloc.getGuias, 
                            giros: scalaSelectBloc.getgiros,  
                            paqueterias: scalaSelectBloc.getpaqueterias, 
                            descripcion: descriptionContollee.text, 
                          );
                            EscalasBloc.streamListOfEscalas();  
                          }else if(
                            scalaSelectBloc.llegada||
                            scalaSelectBloc.salida
                          ){
                            await service.sendDescriptionAndCargo(
                              context:context,
                              idesc: scalaSelectBloc.getIdesc==""?escalasbloc.escala.idEsc:scalaSelectBloc.getIdesc, 
                              bolsas: scalaSelectBloc.getbolsas, 
                              guias: scalaSelectBloc.getGuias, 
                              giros: scalaSelectBloc.getgiros,  
                              paqueterias: scalaSelectBloc.getpaqueterias, 
                              descripcion: descriptionContollee.text, 
                            );
                            EscalasBloc.streamListOfEscalas();
                          }
                        }else{
                          dialogError('Programacion Completada', 'Ya se termino la programacion no puede solicitar conformidad', context);
                        }                               
                      },
                );                  
              },
              addIcon: false
            ),
            Container(height: 20),
          ],
        )
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

  cuerpo(kilometraje){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TileInput(      
            OnlyNumber: true,
            isRed: true,                                                  
            controller:kilometraje,
            title: "KILOMETRAJE"
          ),   
          fechaHora()     
        ],
      ),
    );
  }
  fechaHora(){
    return Row(
          children: [
            BoxInfo(
              title: 'FECHA',
              subtitle: EscalasDetails.fecha,
            ),
            Expanded(child: Container()),
            BoxInfo(
              title: 'HORA',
              subtitle: EscalasDetails.hora,
            ),
          ],
        );
  }

  description(context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("DESCRIPCION",style: DesingText.sansBoldText(14,Colors.black),),
          Container(width: 5.0,height: 5.0),
          InputGlobalDesing(
            enabled: ProgramacionBloc.Completado,
            hintText: 'Descripcion de la Carga',
            controller: descriptionContollee,
            maxlines: 4,
            width: size.width*0.95 ,
          ),
        ],
      ),
    );
  }

}
