import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Bloc/ProgramBloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Models/Card-Programacion.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Widgets/Slide-ListTile.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/Drawer.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/layout-view.dart';
import 'package:flutter/material.dart';

class ProgramcionView extends StatelessWidget {
  static final String name = "program";
  const ProgramcionView({Key? key}) : super(key: key);
  static final ProgramacionBloc provides =  ProgramacionBloc();
  @override
  Widget build(BuildContext context) {
    return LayoutView(
      menuButom: [
        IconButton(onPressed: (){
          provides.callService();
        },
        icon: Icon(Icons.refresh))
      ],
      drawer: DrawerWidget(),

      titleAppbar: 'PROGRAMACIÓN',

      body: body(),
      appbar: true,
    );
  }

  Widget body() {
    
    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.only(top: 0,bottom: 0),
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: StreamBuilder<List>(

        stream:  provides.programacion,

        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          //print("${snapshot.data}");
          var shotsnap;
          if (snapshot.data != null) {
            shotsnap = snapshot.data;
            List<Programacion> data = shotsnap;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top:6,bottom:6),
                      itemCount: data.length,
                      itemBuilder: (_, int i) {

                        var bloq = 0;

                        var bloqSlidable = true;
                       // if()
                        if(data[i].estadoRuta?.estado=='1'){

                          ProgramacionBloc.bloqProcess = true;

                        }
                       // VarProgramacion.rutaProgramacion = data[i].ruta.toString();
                        /*if(i!=0){
                          if(i==data.length-1)
                          {
                            print("ultima escala");
                            if(data[i-1].estado==1){
                              bloq=0;
                              bloqSlidable = true;
                              print("entro");
                            }else{
                              bloq=1;
                              bloqSlidable = false;
                          }
                          }else
                          {
                            if(data[i-1].estado==1){
                              bloq=0;
                              bloqSlidable = true;
                              print("entro");
                              }else{
                                bloq=1;
                                bloqSlidable = false;
                              }
                          }
                        }*/
                        return Container(                          
                          padding: EdgeInsets.only(left: 9,right: 9,top: 4,bottom: 4),
                          child: SlideListTile(
                            choferFinal: data[i].estadoRuta?.choferFinal.toString(),
                            choferInicial: data[i].estadoRuta?.choferInicial.toString(),
                            ChoferOne: data[i].choferOne.toString(),
                            ChoferTwo: data[i].choferTwo.toString(),
                            lockSlidable:bloqSlidable,
                            estadoRuta: data[i].estadoRuta??EstadoRuta(),
                            destinosNombre:data[i].destinosNombre??[],
                            idcarGroup: data[i].idcarGrupo.toString(),
                            placa: data[i].placa.toString(),
                            ruta: data[i].ruta.toString(),
                            fecha: data[i].fecha.toString(),
                            codigo: data[i].codigo.toString(),
                            origen: data[i].origen.toString(),
                            destino: data[i].destino.toString(), 
                            bloqueoTap:bloq,
                            //bloqueoTap: bloq,
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
