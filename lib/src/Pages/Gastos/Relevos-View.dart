import 'package:capacitacion_flutter_gran_chapo/src/Pages/Gastos/Bloc/Relevos-Bloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Gastos/Models/user-Relevo.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Gastos/Screens/ListGastos-View.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Gastos/Services/Relevos-Service.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Gastos/Widgets/ItemGastos.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Gastos/Widgets/ListGastos.dart';

import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';

import 'package:capacitacion_flutter_gran_chapo/src/Widgets/Alert.dart';

import 'package:capacitacion_flutter_gran_chapo/src/Widgets/layout-view.dart';
import 'package:flutter/material.dart';

class GasstosView extends StatefulWidget {
  static final String name = "GasstosView";
  const GasstosView({Key? key}) : super(key: key);
  static final GastosService gastosService = GastosService();
  static final TextEditingController controllerPlace =
      new TextEditingController();
  static final TextEditingController controllerObser =
      new TextEditingController();
  static final TextEditingController controlleTry = new TextEditingController();
  static final TextEditingController controlleTypeDoc =
      new TextEditingController();
  static final TextEditingController controllerSerie =
      new TextEditingController();
  static final TextEditingController controllerdocumento =
      new TextEditingController();
  static final TextEditingController controllerfactu =
      new TextEditingController();
  static final TextEditingController controllerRuc =
      new TextEditingController();
  static final TextEditingController controllerMonto =
      new TextEditingController();

  static final now = new DateTime.now();
  static final String fecha = "${now.year}/${now.month}/${now.day}";
  static final String hora = "${now.hour}:${now.minute}";

  @override
  _GasstosViewState createState() => _GasstosViewState();
}

class _GasstosViewState extends State<GasstosView> with AlertGeneral {
  @override
  Widget build(BuildContext context) {
    return LayoutView(
        menuButom: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, GasstosListView.name);
              },
              icon: Icon(
                Icons.list,
                color: Colors.white,
              )),
        ],
        //drawer: DrawerWidget(),
        titleAppbar: 'GASTOS',
        body: body(context),
        appbar: true);
  }

  body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GasstosListView()));
              },
                child: Text('Listar Gastos')
              ),*/
              Container(
                  margin: EdgeInsets.only(top: 25, bottom: 10, left: 9),
                  child: Text(
                    'REGISTRAR GASTO',
                    style: DesingText.sansBoldText(20, Flush.colorTextTitle),
                  )),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.symmetric(vertical: 20),
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 8, left: 12),
                        child: Text(
                          'TIPO DE GASTO',
                          style: DesingText.sansBoldText(15, Flush.titleSec),
                        )),
                    Container(
                      // margin: EdgeInsets.only(right: 7,left: 7),
                      child: ListDetailsGastos(),
                    ),
                  ],
                ),
              ),
              listofGastos(),

              //cardRegistrarRlevo(context),
              //listOfRlevos(),
            ],
          ),
        ),
      ),
    );
  }

  Widget listofGastos() {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 5, right: 5, bottom: 15),
      height: size.height * 0.35,
      width: size.width * 0.95,
      child: StreamBuilder<List>(
        stream: GastosBloc.callServiceLimit().gastosLimit,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          //print("${snapshot.data}");
          var shotsnap ;
          print('snapshot');
          print(snapshot.data);
          if (snapshot.data != null) {
            shotsnap = snapshot.data!;
            List<itemGasto> data = shotsnap;

            if(data==[]){
              return Container();

            }else{
             return  ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, int i) {
                  // VarProgramacion.rutaProgramacion = data[i].ruta.toString();
                  return Container(
                    padding: EdgeInsets.only(
                      left: 1,
                      right: 1,
                      bottom: 5,
                    ),
                    child: ListTileGastos(
                      id_chofer: data[i].id_chofer ?? '',
                      comprobante: data[i].comprobante ?? '',
                      fecha: data[i].fecha ?? '',
                      nombre: data[i].nombre ?? '',
                      monto: data[i].monto ?? '',
                      tipo_doc: data[i].tipo_doc ?? '',
                      serie: data[i].serie ?? '',
                      tipo_gasto: data[i].tipo_gasto ?? '',
                      hora: data[i].hora ?? '',
                      num_doc: data[i].num_doc ?? '',
                    ),
                  );
                });
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
