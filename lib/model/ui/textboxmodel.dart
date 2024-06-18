

import 'package:flutter/material.dart';

class TextBoxModel {
  var u = UniqueKey();
  var fc = FocusNode();
  TextEditingController tc = new TextEditingController();
  bool? isPassword = false;
  bool? isReadonly = true;
  int? maxline = null;
  int? minline = null;

  TextInputAction? inputAction; // TextInputAction.done
  TextInputType? keyboardtype; // TextInputType.text

  String errorText = "";
  String hintText = "";

  DateTime? date;

  TextBoxModel({this.inputAction, this.maxline, this.minline, this.keyboardtype, required this.hintText, this.isPassword, this.isReadonly});


}