import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Bloc/ProgramBloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Relevos/Bloc/Relevos-Bloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Relevos/Models/user-Relevo.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Relevos/Services/Relevos-Service.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Utils/Colum-Builder.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/BotonGeneral.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/BoxInfo.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/TileInput.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/layout-view.dart';
import 'package:flutter/material.dart';

class RelevosView extends StatelessWidget {
  static final String name = "RelevosView";

  const RelevosView({Key? key}) : super(key: key);

  static final RelevosService relevosService = new RelevosService();

  static final TextEditingController controllerPlace =
      new TextEditingController();

  static final RelevosBloc relevosB = RelevosBloc();

  static final now = new DateTime.now();

  static final String fecha = "${now.year}/${now.month}/${now.day}";

  static final String hora = "${now.hour}:${now.minute}";

  @override
  Widget build(BuildContext context) {
    return LayoutView(
        //drawer: DrawerWidget(),
        titleAppbar: 'RELEVOS',
        body: body(context),
        appbar: true);
  }

  body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(top: 15, bottom: 10),
                child: Text(
                  ProgramacionBloc.rutaname,
                  style: DesingText.sansBoldText(18, Flush.colorTextTitle),
                )),
            cardRegistrarRlevo(context),
            SizedBox(
              height: 30,
            ),
            listOfRlevos(),
            // SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }

  cardRegistrarRlevo(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Flush.carRelevos, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          TileInput(
            enabled: ProgramacionBloc.Completado,
            hintText: "PIURA",
            controller: controllerPlace,
            title: 'LUGAR DONDE INCIA EL RELEVO',
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: BoxInfo(
                    subtitleSize: 11,
                    title: 'FECHA',
                    subtitle: fecha,
                  ),
                ),
                Expanded(
                  child: BoxInfo(
                    subtitleSize: 11,
                    title: 'HORA',
                    subtitle: hora,
                  ),
                ),
              ],
            ),
          ),
          BotonGeneral(
              color: Flush.colorGlobal,
              addIcon: true,
              titlebuton: 'INICIAR RELEVO',
              event: () async {
                if (ProgramacionBloc.Completado) {
                  if (controllerPlace.text.length == 0) {
                    dialogError('Ocurrio un Error',
                        'Tiene que especificar el lugar de relevo', context);
                  } else {
                    var response = await relevosService
                        .serviceRegisterRelevos(controllerPlace.text);
                    controllerPlace.text = '';
                    FocusScope.of(context).requestFocus(FocusNode());
                    relevosB.callService();
                    dialogError('Relevo Guardado', response['msn'], context);
                  }
                } else {
                  dialogError('No puede iniciar relevo',
                      'Ya se termino la programacion', context);
                }
              })
        ],
      ),
    );
  }

  dialogError(String titulo, String texto, BuildContext context) {
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
            ));
  }

  listOfRlevos() {
    return Expanded(
      child: Container(
        child: StreamBuilder<List<Userrelevo>>(
          stream: relevosB.relevoithcallService,
          builder:
              (BuildContext context, AsyncSnapshot<List<Userrelevo>> snapshot) {
            print("snapshot list relevos${snapshot.data}");
            var shotsnap;
            if (snapshot.data != null) {
              shotsnap = snapshot.data;
              List<Userrelevo> data = shotsnap;
              return ListView(children: [
                ColumnBuilder(
                    itemBuilder: (context, i) {
                      return relevoItem(data[i]);
                    },
                    itemCount: data.length),
              ]);
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: Flush.colorGlobal,
              ));
            }
          },
        ),
      ),
    );
  }

  relevoItem(Userrelevo user) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,top: 15,bottom: 10),
      margin: EdgeInsets.only(top: 0, bottom: 15),
      decoration: BoxDecoration(
          color: Color(0xffF2F4F7), borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: BoxInfo(
                    title: user.idchofer,
                    subtitle: user.nombre,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: BoxInfo(
                    title: 'FECHA',
                    subtitle: user.fecha,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: BoxInfo(
                    title: 'HORA',
                    subtitle: user.hora,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              //color: Colors.red,
              padding: EdgeInsets.only(left: 35,right:35,top: 8,bottom:0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BoxInfo(
                    titleSize: 17,
                    colorTitle: Flush.colorTextTitle,
                    title: user.lugar,
                    subtitle: '',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
