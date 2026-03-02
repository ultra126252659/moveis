
<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/image&icon.dart';
=======


import 'package:flutter/material.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
>>>>>>> devAlaa

class ScreenShotList extends StatelessWidget {
  const ScreenShotList({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(

      child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){

<<<<<<< HEAD
            return   ClipRRect(borderRadius: BorderRadius.circular(16),child: Image.asset(ImageApp.byDetails,fit: BoxFit.cover,),);
=======
            return   ClipRRect(borderRadius: BorderRadius.circular(16),child: Image.asset(ImageApp.bgHome,fit: BoxFit.cover,),);
>>>>>>> devAlaa

          }, separatorBuilder: (constext, index){return SizedBox(height: 15,);}, itemCount: 3),
    );
  }
}
