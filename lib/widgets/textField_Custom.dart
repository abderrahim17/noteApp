
import 'package:flutter/material.dart';

class CustomTextForm_Field extends StatelessWidget {
  CustomTextForm_Field(
      {required this.hint,
        this.onchanged,
        this.Validator,
        this.icon,
        required this.clr1,
        required this.clr2,
        this.onsubmitted,
        this.secureText=false});

  String? hint;
  Function(String)? onchanged, onsubmitted;
  bool? secureText;

  Icon? icon;

// dynamic Function(String)? Validator ;
  var Validator;
  Color? clr1;
  Color? clr2;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: secureText!,  ///to make the text invisible
        validator: Validator,
        onChanged: onchanged,
        onFieldSubmitted: onsubmitted,
        cursorColor: clr1,
        decoration: InputDecoration(
          suffixIcon: icon,

          suffixIconColor: clr1,

//# this was for the normal state of the text field
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: clr1!),
              borderRadius: BorderRadius.circular(20)),

//           )),

//# this was for when we click  of the text field
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: clr1!),
              borderRadius: BorderRadius.circular(20)),
          labelText: 'enter your $hint',
          labelStyle: TextStyle(color: clr2!),
          hintText: hint,
          hintStyle: TextStyle(color: clr2),
        ));
  }
}