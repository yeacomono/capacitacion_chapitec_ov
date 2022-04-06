import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:flutter/material.dart';

class BoxInfo extends StatelessWidget {
  final String? title;
  final bool centrado;
  final double? titleSize;
  final double? subtitleSize;
  final String? subtitle;
  final Color? colorTitle;
  final Color? colorSubtitle;
  const BoxInfo(
      {Key? key,
      this.centrado= false,
      this.colorTitle,
      this.colorSubtitle,
      this.title,
      this.subtitle,
      this.titleSize,
      this.subtitleSize
      }
    )
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        //padding: EdgeInsets.all(20),
        //color: Colors.amberAccent,
        //width: 300,
        child: Column(
      crossAxisAlignment: centrado?CrossAxisAlignment.start:CrossAxisAlignment.center,
      children: [
        Text(
          title ?? 'Error',
          style: DesingText.sansBoldText(titleSize??null,colorTitle??Flush.titleSec)
        ),
        Text(
          subtitle ?? 'Error',
          style:DesingText.regularText(12,colorSubtitle??Flush.colorTextsubtitle)

        ),
      ],
    ));
  }
}
