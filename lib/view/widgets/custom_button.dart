import 'package:flutter/material.dart';

import '../../constants.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key key, this.text, this.onPressed}) : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton (
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(18),
        onPressed: onPressed,
        child: CustomText(text: text,alignment: Alignment.center,color: Colors.white,),
        color: primaryColor,
    );

  }
}
