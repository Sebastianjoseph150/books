import 'package:flutter/material.dart';

class textfield extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int lines;
  const textfield({
    super.key,
    required this.hint,
    required this.controller,
    required this.lines,
  });
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Mandatory field';
          } else {
            return null;
          }
        },
        maxLines: lines,
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide:const  BorderSide(color: Colors.orange, width: 2.0),
            borderRadius: BorderRadius.circular(6),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusColor: Colors.orange,
          contentPadding:const  EdgeInsets.all(6),
          hintText: hint,
        ),
      );
  }
}