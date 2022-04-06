import 'package:capacitacion_flutter_gran_chapo/src/Mixins/AlertsMixin.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Escalas-view.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Gastos/Relevos-View.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Bloc/PaperRuta.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Bloc/ProgramBloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Models/Card-Programacion.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Screens/HojaRuta/Widgets/BloqueRuta.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Services/HojaRuta-Service.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Relevos/Bloc/Relevos-Bloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Relevos/Relevos-View.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Relevos/Services/Relevos-Service.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Singleton/LoginUser.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Singleton/VarsProgramacion.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/BotonGeneral.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/Drawer.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/layout-view.dart';
import 'package:flutter/material.dart';

//EstadoRuta estRuta = ProgramacionBloc.estadoRutta;
LoginUser loginUser = LoginUser();
class HojaRutaView extends StatefulWidget {

  static final String name = "HojaRutaView";

  static final RelevosService relevosService = new RelevosService();
  static final RelevosBloc relevosB =  RelevosBloc();

  const HojaRutaView({Key? key}) : super(key: key);

  @override
  _HojaRutaViewState createState() => _HojaRutaViewState();
}

class _HojaRutaViewState extends State<HojaRutaView> with AlertsMixin {
  //est = estado
  
  EstadoRuta estRuta = ProgramacionBloc.estadoRutta;
  TextEditingController kilometraje    = TextEditingController();
  TextEditingController candados       = TextEditingController();
  TextEditingController kilometrajeEnd = TextEditingController();
  TextEditingController candadosEnd    = TextEditingController();
  bool bloqMenuItem = false;
  LoginUser loginUser = new LoginUser();
  PaperRutaBLoc paperRutaBLoc = PaperRutaBLoc();
  HojaService hojaService = new HojaService();
  List<String> choices = ["Inicio", "Relevos", "Escala", "Gastos"];
  ProgramacionBloc programacionBloc = ProgramacionBloc();
  bool loadingBack = false;
  @override
  void initState() {
    print('choferes 1: ${ProgramacionBloc.choferOne} + 2: ${ProgramacionBloc.choferTwo}');
    print( estRuta.candadosArrive);
   super.initState();
   kilometraje.text     = estRuta.kilometrajeInit??"";
   candados.text        = estRuta.candadosInit??""; 
   kilometrajeEnd.text  = estRuta.kilometrajeArrive??"";
   candadosEnd.text     = estRuta.candadosArrive??"";    
   if(estRuta.estado==null||estRuta.estado=="0" ){
     bloqMenuItem = true;
   }else{
     bloqMenuItem = false;
   }
  }
  @override
  Widget build(BuildContext context) {
    return LayoutView(
      //drawer: DrawerWidget(),
      titleAppbar: ProgramacionBloc.rutaname,
      body: body(context),
      appbar: true,
      leading:!loadingBack?IconButton(
          onPressed: ()async{
          setState(() {
            loadingBack = true;
          });
          var resp = await programacionBloc.callService();
          if(resp["valor"]==1){
             Navigator.pop(context);
          }else{
            setState(() {
            loadingBack = false;
          });
          }
          paperRutaBLoc.resetBtnEstado();
          ProgramacionBloc.bloqProcess = false;

 
        }, 
        icon: Icon(Icons.arrow_back)
      ):Padding(
        padding: const EdgeInsets.all(18.0),
        child: CircularProgressIndicator(color: Colors.white,),
      ),
      menuButom: [
        PopupMenuButton<String>(
          color: Flush.colorGlobal,
          onSelected: choiceAction,
          itemBuilder: (BuildContext context) {
            return choices.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(
                  choice,
                  style: DesingText.sansBoldText(null, Colors.white),
                ),
              );
            }).toList();
          },
        )
      ],
    );
  }

  void choiceAction(String choice) {
    if (choice == "Inicio") {
      print('Navegando a Inicio');

      if(!bloqMenuItem) 
      Navigator.pushReplacementNamed(context, HojaRutaView.name);

    } else if (choice == "Relevos") {

      if(!bloqMenuItem) 
      Navigator.pushNamed(context, RelevosView.name);
      
      print('Navegando a Relevos');
    } else if (choice == "Escala") {

      if(!bloqMenuItem) 
      Navigator.pushNamed(context, EscalasView.name);

      print('Navegando a Escala');
    } else if (choice == "Gastos") {

      if(!bloqMenuItem) 
      Navigator.pushNamed(context, GasstosView.name);
    }
  }

  body(context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Center(
            child: Column(
          children: [
            BloqueRuta(
              Inicio: true,
              choferdos:
                  estRuta.chofer2Init ?? ProgramacionBloc.choferTwo,
              choferuno:
                  estRuta.chofer1Init ?? ProgramacionBloc.choferOne,
              titleRuta: 'INICIO DE RUTA',
              candados: candados,
              kilometraje: kilometraje,
            ),
            btnRuta(),
            BloqueRuta(
              Inicio: false,
              choferdos:
                  estRuta.chofer2Arrive ?? ProgramacionBloc.choferTwo,
              choferuno:
                  estRuta.chofer1Arrive ?? ProgramacionBloc.choferOne,
              titleRuta: 'LLEGADA DE RUTA',
              candados: candadosEnd,
              kilometraje: kilometrajeEnd,
            ),
            btnLlegadaRuta()
          ],
        )),
      ),
    );
  }

  listTile({required Widget title, required Widget subtitle}) {
    return Container(
        //padding: EdgeInsets.all(20),
        //color: Colors.amberAccent,
        //width: 300,
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title,
        subtitle,
      ],
    ));
  }

  
  
  btnRuta() {
    return BotonGeneral(
        height: 30,
        color: estRuta.kilometrajeInit!=null || estRuta.candadosInit!=null?Colors.grey: Flush.colorGlobal,
        addIcon: false,
        titlebuton: 'GRABAR INICIO DE RUTA',
        event: () {           
          if (paperRutaBLoc.initRuta) {
            setState(() {
              
            });
            // para la primera vez que se entra
           if(estRuta.kilometrajeInit==null && estRuta.candadosInit==null){
             // para cuando en la primera vez que se entra no completa todo los datos
             if(int.parse(kilometraje.text)== 0 || kilometraje.text.length==0 || candados.text.length ==0){
               dialogError('Tiene que llenar todos los campos');
               print('hay espacios vacios');
             }
             else{
               print('Grabando Ruta...');
               callInitRuta();  
             }
           }
           else{
             dialogError('Ya se grabo un inicio de ruta ');
             print('no se guardo el inicio de ruta');
           }
          }          
        }
      );
  }

  dialogError(String texto){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('No puede realizar esta accion'),
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

  btnLlegadaRuta() {
    return StreamBuilder<bool>(
      stream: paperRutaBLoc.botonLlegadaRuta,
      initialData: false,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: BotonGeneral(
              height: 30,
              color: snapshot.data==true? Flush.colorGlobal : Colors.grey,
              addIcon: false,
              titlebuton: 'GRABAR LLEGADA DE RUTA',
              event: () {
                if (snapshot.data==true) {
                  if(estRuta.kilometrajeArrive==null&&estRuta.candadosArrive==null){
                    // para cuando en la primera vez que se entra no completa todo los datos
                    if(int.parse(kilometrajeEnd.text)== 0 || kilometrajeEnd.text.length==0 || candadosEnd.text.length ==0){
                      dialogError('Tiene que llenar todos los campos');
                      print('hay espacios vacios');
                    }
                  else{
                    print('Grabando Llegada...');
                    llegadaRuta();    
                  }                     
                  }
                  else{
                    dialogError('Ya se grabo una llegada de ruta ');
                    print('no se guardo la llegada de ruta');
                  }
                }
              }),
        );
      },
    );
  }
  callInitRuta() async {

    
    var response = await HojaRutaView.relevosService.serviceRegisterRelevos('INICIO DE RUTA');
    FocusScope.of(context).requestFocus(FocusNode());

    var now = new DateTime.now();
    String month = "${now.year}-${now.month}-${now.day}";
    String hour  = "${now.hour}:${now.minute}:${now.second}";
    //print(month);
   // print(now.hour.toString());
    var resp = await HojaService.requestGrabarInicioRuta(
        choferInicial: loginUser.userData.choferOne?.dni??'',
        ruta: ProgramacionBloc.rutaname,
        chofer1: ProgramacionBloc.choferOne,
        chofer2: ProgramacionBloc.choferTwo,
        fecha: month,
        hora: hour,
        kilometraje: kilometraje.text,
        candados: candados.text);
        print('respuesta (requestGrabarInicioRuta)----->$resp');
    if (resp["valor"] == 1) {
      setState(() {
           bloqMenuItem = true;
      });
      print("object");
      paperRutaBLoc.idGenInitRuta = resp["data"]["id"];
      alertEvento.mostrarCuadro(context,texto: resp["msn"] ?? '', title: "INICIO DE RUTA");
    }
  }

  llegadaRuta() {
    var now = new DateTime.now();
    String month = "${now.year}-${now.month}-${now.day}";
    String hour  = "${now.hour}:${now.minute}:${now.second}";
   // print(month);
   // print(now.hour.toString());
    hojaService.requestGrabarLLegadaRuta(
        choferfinal: loginUser.userData.choferOne?.dni??'',
        context:context,
        // este valor se guardaba de manera local pero si cierras la sesion se pierde y no se puede registrar llegada de ruta
        idofInit: ProgramacionBloc.estadoRutta.id??'',//"${paperRutaBLoc.idGenInitRuta}",
        ruta: ProgramacionBloc.rutaname,
        chofer1: loginUser.userData.choferOne!.dni!,
        chofer2: loginUser.userData.choferTwo!.dni!,
        fecha: month,
        hora: hour,
        kilometraje: kilometrajeEnd.text,
        candados: candadosEnd.text);
  }
}
