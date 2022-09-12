import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
   CustomText({this.text= '', this.fontSize= 16, this.color= Colors.black,this.alignment= Alignment.topLeft, this.fontWeight,this.maxlines, this.hight, this.softwrap, this.overflow});

  final String text ;
  final double fontSize ;
  final Color color ;
  final Alignment alignment;
  final FontWeight fontWeight;
  final int maxlines;
  final double hight;
   final bool softwrap;
   final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(text,style: TextStyle(color: color,fontSize: fontSize,fontWeight: fontWeight,height: hight),maxLines: maxlines,softWrap: softwrap,overflow: overflow,),
    );
  }
}
