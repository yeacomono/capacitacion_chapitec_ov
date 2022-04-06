import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:flutter/material.dart';

class BotonGeneral extends StatelessWidget {
  final Function() event;
  final Widget? title;
  final String? titlebuton;
  final double? height;
  final double? width;
  final bool addIcon;
  final bool borderCircle;
  final double borderRaidus;
  final double? sizeTitle;
  final Alignment alignment;
  final Color? color; 
  final Color colortext; 
  final Color colorIcon;

  final Widget? widgetTitle; 
  const BotonGeneral(
      {Key? key, 
      required this.event,
      required this.color, 
      this.titlebuton, 
      this.height, 
      this.width, 
      required this.addIcon,      
      this.sizeTitle,
      this.alignment =  Alignment.center,
      this.colortext = Colors.white,
      this.colorIcon = Colors.white,
      this.borderCircle = false, 
      this.borderRaidus = 180.0,
      this.widgetTitle, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(      
        style: TextButton.styleFrom(
          backgroundColor: color,//Flush.colorGlobal,
          shape: borderCircle? 
            RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRaidus),
            side: BorderSide(color: Flush.colorGlobal)         
            ): RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),            
            ),
        ),
        onPressed: event,
        child: Container(
            alignment: Alignment.center,
            //color: Colors.black,
            margin: EdgeInsets.all(0),            
            width: width,
            height: height,
            child: Container(
              //width: double.infinity,
              //color: Colors.black,
              child: Stack(
                alignment: alignment,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                     width: double.infinity,
                     child: addIcon?Icon(Icons.add, color: colorIcon,size: 30,):null,
                  ),
                  widgetTitle??Text(titlebuton??'',style:DesingText.botonblobal(sizeTitle,colortext),)
                ],
              ),
            )
        )
    );
  }
}
