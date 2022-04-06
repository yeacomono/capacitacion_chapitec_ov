import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Modals/DestinoCarguero.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Modals/description.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Screens/DestinoCantidades/Bloc/DestinBloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Screens/DestinoCantidades/Widgets/Card.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Services/Escalas-Destino.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Utils/Colum-Builder.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/layout-view.dart';
import 'package:flutter/material.dart';

class DestinoEnvio extends StatefulWidget {
  static final String name = "DestinoEnvio";
  const DestinoEnvio({ Key? key }) : super(key: key);
  static final DestinoCantBloc _destinosNombre =  DestinoCantBloc();
  static final DestinosEnvService destinosEnvService = DestinosEnvService();
  

  @override
  _DestinoEnvioState createState() => _DestinoEnvioState();
}

class _DestinoEnvioState extends State<DestinoEnvio> {
   Description description = Description();
   @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return LayoutView(
      titleAppbar: 'DESTINO Y ENVIOS',
      body: body(), appbar: true);
  }

  body() {
    return Container(
      child: Container(
        padding: EdgeInsets.only(top: 0),
        width: double.infinity,
        child: StreamBuilder<List<DestCards>>(
          stream:DestinoEnvio._destinosNombre.listodDestinos(),
          builder: (BuildContext context, AsyncSnapshot<List<DestCards>> snapshot) {
           if(snapshot.data!= null){
            var data = snapshot.data;
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: ColumnBuilder(
                      itemCount:data!.length,
                      itemBuilder:(context,i){
                        return CardDestinoCantidades(
                          destCards:data[i],
                          canti: data[i].cantidadPaquetes??"",
                          description:data[i].dCarguero??"" ,
                          titleCard: data[i].name??"",

                        );
                                }),
                    ),
                  ),
                ],
              );
           }else{
             return Center(
               child: CircularProgressIndicator(),
             );
           }
          },
        ),
      ),
    );
  }
}