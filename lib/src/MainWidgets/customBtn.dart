import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final Function onTap;
  final Color color;
  final Color txtColor;
  final double heigh;
  final double width;
  final double padding;

  const CustomBtn(
      {Key key,
      @required this.text,
      @required this.onTap,
      @required this.color,
      this.txtColor,
      this.heigh,
      this.padding, this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8,right: 30,left:30,bottom: 8 ),
      child: MaterialButton(
        onPressed: onTap,
        minWidth: width,
        color: color,
        height: heigh,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: txtColor),
          ),
        ),
      ),
    );
  }
}
