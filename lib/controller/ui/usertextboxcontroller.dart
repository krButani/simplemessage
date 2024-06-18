
import 'package:flutter/material.dart';
import 'package:simplemessage/model/ui/textboxmodel.dart';

class UserTextBoxController {
  TextBoxModel firstnameTH = TextBoxModel(hintText: "First name", keyboardtype: TextInputType.text);
  TextBoxModel lastnameTH = TextBoxModel(hintText: "Lastname name", keyboardtype: TextInputType.text);
  TextBoxModel emailTH = TextBoxModel(hintText: "E-Mail Address", keyboardtype: TextInputType.text);
  TextBoxModel messageTH = TextBoxModel(hintText: "Message", keyboardtype: TextInputType.multiline, minline: 6);

  void clearError() {
    firstnameTH.errorText = "";
    lastnameTH.errorText = "";
    emailTH.errorText = "";
    messageTH.errorText = "";
  }
}
