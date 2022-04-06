import 'package:capacitacion_flutter_gran_chapo/src/Pages/Gastos/Bloc/Relevos-Bloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Gastos/Models/user-Relevo.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Gastos/Services/Relevos-Service.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Gastos/Widgets/ItemGastos.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/Alert.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/layout-view.dart';
import 'package:flutter/material.dart';

class GasstosListView extends StatefulWidget  {
  static final String name = "GasstosListView";
  const GasstosListView({Key? key}) : super(key: key);
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
  _GasstosListViewState createState() => _GasstosListViewState();
}

class _GasstosListViewState extends State<GasstosListView> with AlertGeneral{
  @override
  Widget build(BuildContext context) {
    return LayoutView(
        //drawer: DrawerWidget(),
        titleAppbar: 'LISTA DE GASTOS',
        body: body(context),
        appbar: true);
  }

  body(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [            
            /*Container(
                margin: EdgeInsets.only(top: 25, bottom: 20,left: 9),
                child: Text(
                  'REGISTRAR GASTO',
                  style: DesingText.sansBoldText(20, Flush.colorTextTitle),
                )
            ),
            Container(
                margin: EdgeInsets.only(bottom: 0,left: 12),
                child: Text(
                  'TIPO DE GASTO',
                  style: DesingText.sansBoldText(15, Flush.titleSec),
                )
            ),
            Container(
              margin: EdgeInsets.only(right: 7,left: 7),
              child: ListDetailsGastos(),
            ), */ 
            Expanded(child: listofGastos(),),   
            
            //cardRegistrarRlevo(context),
            //listOfRlevos(),           
          ],
        ),
      ),
    );
  }

    Widget listofGastos() {      
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 12,right: 12, bottom: 15),
      height: size.height*0.35,
      width: size.width*0.95,
      child: StreamBuilder<List>(
        stream: GastosBloc.callService().gastos,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          //print("${snapshot.data}");
          var shotsnap;
          print('snapshot');
          print(snapshot.data);
          if (snapshot.data != null) {
            shotsnap = snapshot.data;            
            List<itemGasto> data = shotsnap;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (_, int i) {
                      // VarProgramacion.rutaProgramacion = data[i].ruta.toString();
                        
                        return Container(
                          padding: EdgeInsets.only(left: 1,right: 1,bottom: 0,top: 12),                          
                          child: ListTileGastos(
                            id_chofer:data[i].id_chofer??'',
                            comprobante:data[i].comprobante??'',
                            fecha:data[i].fecha??'',
                            nombre:data[i].nombre??'',
                            monto:data[i].monto??'',
                            tipo_doc:data[i].tipo_doc??'',
                            serie:data[i].serie??'',
                            tipo_gasto:data[i].tipo_gasto??'',
                            hora:data[i].hora??'',
                            num_doc:data[i].num_doc??'',
                          ),
                        );
                      }),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

}
