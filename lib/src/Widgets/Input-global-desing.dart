import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:flutter/material.dart';

class InputGlobalDesing extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Icon? icon;
  final String? hintText;
  final int? maxlines;
  final double? width;
  final double? height;
  final bool isPassword;
  final bool isOnlyNumber;
  final bool isKM;
  final bool isBorderRed;
  final Color? coloinput;
  final double? paddingDecoration;
  final bool? enabled;

  const InputGlobalDesing(
      {Key? key, 
      this.controller,
      this.enabled = true,
      this.isBorderRed = false,
      this.isKM = false,
      this.isOnlyNumber = false,
      this.isPassword = false,
      this.textInputType,
      this.icon,
      this.hintText,
      this.width,
      this.height,
      this.maxlines=1,
      this.coloinput,
      this.paddingDecoration,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Container(
      width: width,
      height: height,
      child: TextField(
        enabled: enabled,
        obscureText: isPassword,
        maxLines:maxlines,
        keyboardType: isOnlyNumber?TextInputType.number:textInputType,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(paddingDecoration??20.0),
          prefixIcon: prefixIcon(),
          suffixStyle: DesingText.sansBoldText(null,Colors.grey),
          suffixText: isKM?'KM':'',
          hintText: hintText,
          hintStyle: TextStyle(color:Flush.colorTextsubtitle),
          enabledBorder: OutlineInputBorder(
            borderSide: isBorderRed?BorderSide(color: Colors.red, width: 1.5,):BorderSide.none,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: isBorderRed?BorderSide(color: Colors.red, width: 1.5,):BorderSide.none,),          
          filled: true,
          fillColor:coloinput??Flush.colorInputGlobal,
        ),
      ),
    );
  }

  prefixIcon() {
    return icon != null
        ? Container(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            margin: const EdgeInsets.only(left: 10.0),
            child: icon)
        : null;
  }
}
