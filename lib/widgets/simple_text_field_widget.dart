
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:propartum/utils/constants.dart';
import 'package:propartum/utils/images.dart';

class SimpleTextFieldWidget extends StatelessWidget {
  final String hintText,errorMessage;
  final TextEditingController controller;
  int maxLines;
  SimpleTextFieldWidget({Key? key,
    required this.hintText,
    required this.controller,
    required this.errorMessage,
    this.maxLines = 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: 1,
      maxLines: maxLines,
      validator: (value){
        if (value!.isEmpty) {
          return errorMessage;
        }
        return null;
      },
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: lightGrey,
        labelStyle: TextStyle(fontSize: 12.0),
        hintStyle: const TextStyle(fontSize: 12.0,color: Colors.grey),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
      ),
    );
  }
}