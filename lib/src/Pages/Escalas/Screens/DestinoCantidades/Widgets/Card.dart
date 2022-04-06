import 'package:capacitacion_flutter_gran_chapo/src/Mixins/AlertsMixin.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Bloc/Escala-Select-Bloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Bloc/Escalas-Bloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Modals/DestinoCarguero.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Services/Escalas-Destino.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/TileInput.dart';
import 'package:flutter/material.dart';

class CardDestinoCantidades extends StatefulWidget {
  final String titleCard;
  final String canti;
  final String description;
  final DestCards destCards;
  const CardDestinoCantidades(
      {Key? key,
      required this.titleCard,
      required this.canti,
      required this.description,
      required this.destCards})
      : super(key: key);

  static DestinosEnvService _destinosEnvService = DestinosEnvService();
  static ScalaSelectBloc escalasSelectBloc = ScalaSelectBloc();

  static EscalasBloc escala = EscalasBloc();


  @override
  _CardDestinoCantidadesState createState() => _CardDestinoCantidadesState();
}

class _CardDestinoCantidadesState extends State<CardDestinoCantidades>
    with AlertsMixin {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController descripcion = new TextEditingController();
    TextEditingController cantidad = new TextEditingController();
    descripcion.text = widget.description;
    cantidad.text = widget.canti;
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color:Flush.colorGlobal,
                ),
                
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.titleCard,
                    style: DesingText.regularBoldText(16, Colors.white),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Icon(Icons.local_shipping),
                    Text("EMBARQUES:2"),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.add_box),
                          Text("PAQUETES:2"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.pages),
                          Text("GUIAS:2"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(widget.description)
                        ),
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          color: Flush.rosado,
                          borderRadius: BorderRadius.circular(5)),
                      child: IconButton(
                        onPressed: () async {
                          CardDestinoCantidades.escalasSelectBloc.trySerRegSalida.sink.add(0);
                          alertGeneral.showDialogGeneral(
                            context,
                            stream: CardDestinoCantidades.escalasSelectBloc.serRegSalida,
                            titleDialgo: Text("Registra tui descripcion"),
                            body: cuerpo(descripcion),
                            eventAgree: ()async{
                           setState(() {
                            loading = true;
                          });
                          print("Lanzando Evento ");
                          var response = await CardDestinoCantidades
                              ._destinosEnvService
                              .senCantidadDescripcion(
                                
                            idesc: CardDestinoCantidades
                                        .escalasSelectBloc.getIdesc ==
                                    ""
                                ? CardDestinoCantidades.escala.escala.idEsc
                                : CardDestinoCantidades
                                    .escalasSelectBloc.getIdesc,
                            destino: widget.titleCard,
                            descripcion: descripcion.text == ""
                                ? widget.description
                                : descripcion.text,
                                cantidadguia:widget.destCards.cantidadGuias??"",
                                cantidadPaquetes: widget.destCards.cantidadPaquetes??"", 
                                idterm: widget.destCards.idTErm??"", 
                                ordencant: widget.destCards.cantidadOrden??"",
                            
                          );
                          if (response["valor"] == 1) {
                            setState(() {
                              loading = false;
                            });
                            alertEvento.mostrarCuadro(context,
                                title: "Add Descrippcion",
                                texto: response["msn"] ?? "");
                          } else if (response["valor"] == 0) {
                            setState(() {
                              loading = false;
                              alertEvento.mostrarCuadro(context,
                                  title: "Add Descrippcion",
                                  texto: response["msn"] ?? "");
                            });
                          }
                          });
                        },
                        icon: !loading
                            ? Icon(
                                Icons.add,
                                color: Colors.white,
                              )
                            : Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(color: Colors.grey,height:5),
            ],
          ),
        ),
      ],
    );
  }
    cuerpo(TextEditingController kilometraje){
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
         // fechaHora()     
        ],
      ),
    );
  }
}
