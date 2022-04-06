import 'dart:io';

import 'package:capacitacion_flutter_gran_chapo/src/Mixins/AlertsMixin.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Bloc/Escala-Select-Bloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Gastos/Screens/ListGastos-View.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Gastos/Services/Relevos-Service.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Relevos/Models/user-Relevo.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/Alert.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/BotonGeneral.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/BoxInfo.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/TileInput.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/layout-view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class RegistrarGasstosView extends StatefulWidget {
  final String tipoGasto;
  static final String name = "RegistrarGasstosView";
  RegistrarGasstosView(this.tipoGasto, {Key? key}) : super(key: key);
  static final GastosService gastosService = GastosService();

  static final now = new DateTime.now();
  static final String fecha = "${now.year}/${now.month}/${now.day}";
  static final String hora = "${now.hour}:${now.minute}";

  @override
  _RegistrarGasstosViewState createState() => _RegistrarGasstosViewState();
}

class _RegistrarGasstosViewState extends State<RegistrarGasstosView>
    with AlertsMixin {
  // controladores de texto
  static TextEditingController controllerPlace     =  new TextEditingController();
  static TextEditingController controllerObser     =  new TextEditingController();
  static TextEditingController controlleTry        =  new TextEditingController();
  static TextEditingController controlleTypeDoc    =  new TextEditingController();
  static TextEditingController controllerSerie     =  new TextEditingController();
  static TextEditingController controllerdocumento =  new TextEditingController();
  static TextEditingController controllerfactu     =  new TextEditingController();
  static TextEditingController controllerRuc       =  new TextEditingController();
  static TextEditingController controllerMonto     =  new TextEditingController();
  ScalaSelectBloc scalaSelectBloc =  ScalaSelectBloc();


  static DateTime now = DateTime.now();
  String fecha = "${now.day}/${now.month}/${now.year}";
  var selectData;
  final picker = ImagePicker();
  String dropdownValue = 'Bv';
  File? image;
  String? imageurl;


  @override
  Widget build(BuildContext context) {
    return LayoutView(
        //drawer: DrawerWidget(),
        titleAppbar: 'GASTOS',
        body: body(context),
        appbar: true);
  }

  body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 5, left: 10),
                child: Text(
                  'REGISTRAR GASTO',
                  style: DesingText.sansBoldText(18, Flush.colorTextTitle),
                )),
            cardRegistrarRlevo(context),
            //listOfRlevos()
          ],
        ),
      ),
    );
  }

  cardRegistrarRlevo(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Flush.background, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 5),
              alignment: Alignment.centerLeft,
              child: Text('TIPO DE GASTO',
                  style: DesingText.sansBoldText(14, Flush.titleSec))),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            alignment: Alignment.centerLeft,
            width: 350,
            height: 35,
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Flush.colorGlobal),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Text(widget.tipoGasto,
                textAlign: TextAlign.right,
                style: DesingText.sansBoldText(17, Flush.colorGlobal)),
          ),
          filofInput(),
          filofInput2(),
          SizedBox(
            height: 5,
          ),
          TileInput(
            paddingDecoration: 20,
            hintText: "30 galones",
            maxlines: 3,
            controller: controllerObser,
            title: 'OBSERVACIONES',
          ),
          SizedBox(
            height: 12,
          ),
          image != null
              ? Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Image.file(
                        image!,
                        width: 160,
                        height: 160,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Flush.rosado),
                          child: IconButton(
                            onPressed: () {
                              print(' Borrar imagen...');
                              setState(() {
                                this.image = null;
                                this.imageurl = null;
                              });
                            },
                            icon: Icon(
                              Icons.close,
                              //size: 30,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                )
              : Text('NO HAY IMAGEN',
                  style:
                      DesingText.regularBoldText(15, Flush.colorTextGeneral)),
          SizedBox(
            height: 5,
          ),
          BotonGeneral(
              height: 35,
              color: Flush.colorGlobal,
              addIcon: false,
              titlebuton: 'ADJUNTAR FOTO DE COMPROBANTE',
              event: () async {
                ModalMenuCamara(); //getImageFromCamera();
              }),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: SizedBox()),
                Expanded(
                  child: BoxInfo(
                    centrado: true,
                    title: 'FECHA',
                    subtitle: RegistrarGasstosView.fecha,
                  ),
                ),
                Expanded(flex: 2, child: SizedBox()),
                Expanded(
                  child: BoxInfo(
                    centrado: true,
                    title: 'HORA',
                    subtitle: RegistrarGasstosView.hora,
                  ),
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
          BotonGeneral(
              color: Flush.colorGlobal,
              addIcon: true,
              titlebuton: 'REGISTRAR GASTO',
              event: () async {
                scalaSelectBloc.trySerRegSalida.sink.add(0);
                alertGeneral.showDialogGeneral(context,
                    stream: scalaSelectBloc.serRegSalida,
                    height: 200,
                    titleDialgo: Text("REGISTRAR GASTO"),
                    body: Text("Esta seguro de iniciar un gasto?"),
                    eventAgree: () {
                  CamposCompletos();
                });
              }),
        ],
      ),
    );
  }

// comprobar si todos los campos estan llenos
  void CamposCompletos() async {
    if (controllerMonto.text.length == 0 ||
            controllerRuc.text.length == 0 ||
            controllerfactu.text.length == 0 ||
            controllerdocumento.text.length == 0 ||
            controllerSerie.text.length == 0 ||
            controlleTypeDoc.text.length == 0
        //controllerObser.text.length==0
        ) {
      dialogError('Llene todos los campos');
    }else{
      
      print('todos los campos estan llenos  + ${controllerMonto.text.length}+ ++ + ');
    var response = await RegistrarGasstosView.gastosService.serviceRegisterRelevos(
      file: imageurl,
      observ: controllerObser.text,
      monto: controllerMonto.text,
      ruc: controllerRuc.text,
      fhfact: fecha,
      numdoc: controllerdocumento.text,
      serie: controllerSerie.text,
      tipodoc: dropdownValue,
      tipogasto:widget.tipoGasto
    );
    print('entro al if');
      controllerPlace.text = '';
      //RelevosBloc.callService();
      showDialog(
          useRootNavigator: false,
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Relevo guardado'),
                content: Text(response['msn'] ?? "Exto"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>GasstosListView()));
                    },
                    child: Text('ok'),
                  )
                ],
              ));
    }
  }

  dialogError(String texto) {
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
            ));
  }

  filofInput() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'TIPO Doc.',
                        style: DesingText.sansBoldText(12, Flush.titleSec),
                      )),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Flush.colorInputGlobal),
                    child: DropdownButton<String>(
                      /* selectedItemBuilder: (BuildContext context){
                      return options.map((String value){
                        return Text(
                          dropdownValue,
                          style: DesingText.regularBoldText(20, Flush.colorTextsubtitle)
                        );
                      }).toList();
                    },*/
                      value: dropdownValue,
                      dropdownColor: Flush.colorInputGlobal,
                      elevation: 0,
                      onChanged: (String? newValue) {
                        setState(() {
                          print('ayua $newValue');
                          dropdownValue = newValue ?? 'HOLA';
                        });
                      },
                      items: <String>['Bv', 'Fa']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: DesingText.regularBoldText(
                                  20, Flush.colorTextsubtitle)),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              )
              /*TileInput(
               paddingDecoration: 15,
              hintText:"FE",
              //height: 45,
                sizeTitle: 12, title: "TIPO Doc", controller: controlleTypeDoc),*/
              ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            flex: 2,
            child: TileInput(
                OnlyNumber: true,
                paddingDecoration: 15,
                hintText: "002",
                //height: 45,
                sizeTitle: 12,
                title: "SERIE",
                controller: controllerSerie),
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            flex: 3,
            child: TileInput(
                OnlyNumber: true,
                paddingDecoration: 15,
                hintText: "1236666",
                //  height: 45,
                sizeTitle: 12,
                title: "N° DOCUMENTO",
                controller: controllerdocumento),
          ),
        ],
      ),
    );
  }

  filofInput2() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(// modulo de fecha
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10), child: Text('F. FACTURACIÓN',style: DesingText.sansBoldText(12,Flush.titleSec),)
                ), 
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Flush.colorInputGlobal
                  ),
                  child: FlatButton(
                    onPressed:callDatePicker
                    , child: Text('$fecha')),
                ) 
                /*
                
                TileInput(
                  paddingDecoration: 15,
                   hintText:"03/09/2021",
                  //   height: 45,
                    sizeTitle: 12,
                    title: "F. FACTURACIÓN",
                    controller: controllerfactu),*/
              ],
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            flex: 3,
            child: TileInput(
                OnlyNumber: true,
                paddingDecoration: 15,
                hintText: "20563023016",
                // height: 45,
                sizeTitle: 12,
                title: "RUC",
                controller: controllerRuc),
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            flex: 2,
            child: TileInput(
                OnlyNumber: true,
                paddingDecoration: 15,
                hintText: "300.00",
                // height: 45,
                sizeTitle: 12,
                title: "MONTO",
                controller: controllerMonto),
          ),
        ],
      ),
    );
  }


  relevoItem(Userrelevo user) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: Flush.listTileFond, borderRadius: BorderRadius.circular(20)),
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                      backgroundColor: Flush.colorGlobal,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoxInfo(
                  centrado: true,
                  title: user.idchofer,
                  subtitle: user.nombre,
                ),
                BoxInfo(
                  centrado: true,
                  title: 'FECHA',
                  subtitle: user.fecha,
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoxInfo(
                  title: user.lugar,
                  subtitle: '',
                ),
                BoxInfo(
                  title: 'HORA',
                  subtitle: user.hora,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // METODOS Y WIDGET DE LA FECHA DE FACTURACION
  // modulo de fecha

  void callDatePicker()async{

    var _currentSelectedData = await getDatePickerWidget();
    setState(() {
      selectData= _currentSelectedData??DateTime.now();
      fecha = "${selectData.day}/${selectData.month}/${selectData.year}";
    });
  }

  Future <DateTime?> getDatePickerWidget(){
    return showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2019), 
      lastDate: DateTime(2030),
      builder: (context, child){
        return Theme(
          data: ThemeData.fallback(),
          child: child??Text(''),
          );
      }
    );
  }



  //////////////////////// METODOS Y WIDGET PARA LA CAMARA////////////////////////////

  ModalMenuCamara() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('SELECCIONAR MEDIO',style: DesingText.regularBoldText(15, Flush.colorGlobal),),
              content: Container(
                height: 100,
                child: Column(
                  children: [
                    BotonGeneral(
                        height: 20,
                        borderCircle: true,
                        borderRaidus: 9.0,
                        color: Colors.blueGrey.shade50,
                        colorIcon: Flush.colorGlobal,
                        colortext: Flush.colorGlobal,
                        alignment: Alignment.center,
                        titlebuton: "CAMARA",
                        width: 100,
                        event: () {
                          getImageFromCamera();
                          Navigator.pop(context);
                        },
                        addIcon: false),
                    BotonGeneral(
                        height: 20,
                        borderCircle: true,
                        borderRaidus: 9.0,
                        color: Colors.blueGrey.shade50,
                        colorIcon: Flush.colorGlobal,
                        colortext: Flush.colorGlobal,
                        alignment: Alignment.center,
                        titlebuton: "GALERIA",
                        width: 100,
                        event: () {
                          getImageFromGalery();
                          Navigator.pop(context);
                        },
                        addIcon: false),
                  ],
                ),
              ),
              actions: <Widget>[],
            ));
  }

  Future getImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      print('que trae image');
      print(image);
      final imageTemporary = File(image.path);

      var response = await RegistrarGasstosView.gastosService
          .serviceUploadPhoto(file: imageTemporary);

      setState(() {
        this.image = imageTemporary;
        this.imageurl = response;
      });
    } on PlatformException catch (e) {
      print('fallo levantar la camara');
    }
  }

  Future getImageFromGalery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      print('que trae image');
      print(image);
      final imageTemporary = File(image.path);

      var response = await RegistrarGasstosView.gastosService
          .serviceUploadPhoto(file: imageTemporary);

      setState(() {
        this.image = imageTemporary;
        this.imageurl = response;
      });
    } on PlatformException catch (e) {
      print('fallo levantar la camara');
    }
  }
  /*Widget _uploadMedia(){
    return Center(
      child: MediaButton(
        type: TypeMedia.CAMERA,
        expanded: (_fileManager.isEmpty),
        onSelect: (File file){
          setState(() {
            _fileManager.pushFile(file);
          });
        },
      ),
    );
  }*/
}
