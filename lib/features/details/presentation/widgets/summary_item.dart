import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/style_app.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         Padding(
           padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
           child: Text(AppString.summary,style: StyleApp.lgText,),

         ),
         SizedBox(
           height: 250.h,
           child: Padding(
             padding:  EdgeInsets.symmetric(horizontal: 16),
             child: SingleChildScrollView(
               child: Text(
                   'Following the events of ',
                   style:StyleApp.smText.copyWith(letterSpacing: 0)
               )
               ,
             ),
           )
         )

       ],
    );
  }
}
