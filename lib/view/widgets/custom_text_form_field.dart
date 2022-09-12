import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({this.text, this.hint, this.onSave, this.validator, this.type});

  final String text;
  final String hint;
  final Function onSave;
  final Function validator;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(text: text,color: Colors.grey.shade900,fontSize: 14,),
          TextFormField(
            keyboardType: type,
            onSaved: onSave,
            validator: validator,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                fillColor: Colors.white
            ),
          )
        ],
      ),
    );
  }
}
