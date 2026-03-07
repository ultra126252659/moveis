import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/style_app.dart';

class SummaryItem extends StatelessWidget {
  String summary;
  SummaryItem({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         Padding(
           padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
           child: Text(AppString.summary,style: StyleApp.lgText,),

         ),
         Padding(
           padding:  EdgeInsets.symmetric(horizontal: 16),
           child: SingleChildScrollView(
             child: Text(
                summary,
                 style:StyleApp.smText.copyWith(letterSpacing: 0)
             )
             ,
           ),
         )

       ],
    );
  }
}
