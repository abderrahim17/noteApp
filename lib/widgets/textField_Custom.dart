import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.maxlines,this.hint,  required this.onchanged});

  String? hint;
  Function(String)? onchanged;
  int? maxlines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxlines,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20)),
          labelText: '$hint',
          labelStyle: const TextStyle(color: Colors.grey),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        onChanged: onchanged);
  }
}
