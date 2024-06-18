import 'package:flutter/material.dart';
import 'package:simplemessage/config/krButani/all.dart';
import 'package:simplemessage/model/ui/textboxmodel.dart';

class TextBoxUi extends StatefulWidget {
  KSize k;
  TextBoxModel sch;
  String title;
  EdgeInsets? padding;
  TextBoxUi({super.key, required this.k, required this.sch, required this.title, this.padding});

  @override
  State<TextBoxUi> createState() => _TextBoxUiState();
}

class _TextBoxUiState extends State<TextBoxUi> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: widget.k.w(100),
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: widget.k.w(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: ThemeClass.setStyle(
                fontSize: 18.kp,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: widget.k.h(0.5),
          ),
          TextFormField(
              key: widget.sch.u,
              maxLines: widget.sch.maxline,
              minLines: widget.sch.minline,
              textInputAction: (widget.sch.inputAction != null)
                  ? widget.sch.inputAction
                  : TextInputAction.next,
              keyboardType: (widget.sch.keyboardtype != null)
                  ? widget.sch.keyboardtype
                  : TextInputType.text,
              focusNode: widget.sch.fc,
              style: ThemeClass.setStyle(
                  fontSize: 14.kp, textColor: textColor, fontWeight: FontWeight.w500),
              controller: widget.sch.tc,
              enabled: (widget.sch.isReadonly != null)
                  ? widget.sch.isReadonly
                  : true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: widget.k.h(0.5), horizontal: widget.k.w(3)),
                errorText: (widget.sch.errorText != "")
                    ? widget.sch.errorText
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.k.w(2)),
                  borderSide: const BorderSide(width: 1, color: borderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.k.w(2)),
                  borderSide: const BorderSide(width: 1, color: borderColor),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.k.w(2)),
                  borderSide: const BorderSide(width: 1, color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.k.w(2)),
                  borderSide: const BorderSide(width: 1, color: borderColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.k.w(2)),
                  borderSide: const BorderSide(color: tErrorColor, width: 1),
                ),
                hintStyle: ThemeClass.setStyle(
                    fontSize: 14.kp, textColor: texthintColor, fontWeight: FontWeight.w500),
                errorStyle: ThemeClass.setStyle(
                    fontSize: 14.kp, textColor: tErrorColor, fontWeight: FontWeight.w500),
                hintText: widget.sch.hintText,
              ),
              onChanged: (val) {}),
        ],
      ),
    );
  }
}
