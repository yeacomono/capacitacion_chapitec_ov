import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/Input-global-desing.dart';
import 'package:flutter/material.dart';

class TileInput extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final bool isRed;
  final double? sizeTitle;
  final int?  maxlines;
  final double? paddingDecoration;
  final TextEditingController controller;
  final bool enabled;
  final bool OnlyNumber;

  final String? hintText; 
  const TileInput({Key? key,this.OnlyNumber = false,this.enabled= true, required this.title,this.isRed = false, this.width, this.height,required this.controller, this.sizeTitle, this.maxlines=1, this.hintText, this.paddingDecoration=10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
        margin: EdgeInsets.only(bottom: 10), child: Text(title,style: DesingText.sansBoldText(sizeTitle,Flush.titleSec),)
      ),
      InputGlobalDesing(
        isOnlyNumber: OnlyNumber,
        enabled: enabled,
        height: height,    
        hintText: hintText,  
        paddingDecoration: paddingDecoration,
          maxlines:maxlines ,  
          isKM: isRed,      
          controller:  controller,
          width: width,
          
        ),
      ],
    );
  }
}
