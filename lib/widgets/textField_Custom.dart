import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.maxlines,this.hint,  @required this.onchanged, this.onsaved, this.controller});

  String? hint;
  Function(String)? onchanged;
  int? maxlines;
  final TextEditingController? controller;
  final void Function(String?)? onsaved;
  @override

  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      onSaved: onsaved,
      maxLines: maxlines,
        validator: (value) {
        /// this ?? inside the if is to check if the value is null (if it's null then do true)
        if (value?.isEmpty ?? true ){
          return 'value is required';

        }else{ return null;}

        }
,

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
