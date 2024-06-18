import 'package:flutter/material.dart';
import 'package:simplemessage/config/krButani/all.dart';
import 'package:simplemessage/model/users.dart';

class MessageCard extends StatefulWidget {
  KSize k;
  Users user;
  MessageCard({super.key, required this.k, required this.user});

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.k.w(100),
      margin: EdgeInsets.symmetric(vertical: widget.k.h(1)),
      padding: EdgeInsets.symmetric(horizontal: widget.k.w(5),vertical: widget.k.h(1)),
      decoration: BoxDecoration(
          color: kbgColor,
          borderRadius: BorderRadius.all(Radius.circular(widget.k.w(2))),
          boxShadow: const [
            BoxShadow(
                color: shadowColor,
                blurRadius: 7,
                spreadRadius: 1,
                offset: Offset(0, 0)
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("\"${widget.user.message}\"",style: ThemeClass.setStyle(
              fontSize: 14.kp,
              textColor: textColor,
              fontWeight: FontWeight.w600
          ),),
          SizedBox(height: widget.k.h(4),),
          Text("${widget.user.firstname} ${widget.user.lastname}",style: ThemeClass.setStyle(
              fontSize: 12.kp,
              textColor: textColor,
              fontWeight: FontWeight.w600
          ),),
          Text(widget.user.email,style: ThemeClass.setStyle(
              fontSize: 12.kp,
              textColor: texthintColor,
              fontWeight: FontWeight.w600
          ),),
        ],
      ),
    );
  }
}
