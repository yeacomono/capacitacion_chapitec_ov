import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:flutter/material.dart';

class BotonInfoRessult extends StatelessWidget {
  final String type;
  final String infoType;
  const BotonInfoRessult({ Key? key,required this.type,required this.infoType }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color(0xffE6E8EF)
        ),
        onPressed:null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(type,style:DesingText.botonblobal(10, null)),
          Text(infoType),
        ],),
    );
  }
}