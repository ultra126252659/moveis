import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  CustomBtn({super.key,required this.text ,required this.onPressed});
  Function() ? onPressed;
  String text;
  @override
  Widget build(BuildContext context) {
    return      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
          width: double.infinity,
          height: 58,
          child: ElevatedButton(onPressed:onPressed,style: ElevatedButton.styleFrom(backgroundColor: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))), child: Text(text,style: TextStyle(color: Colors.white),))),
    );
  }
}