
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/image&icon.dart';

class ScreenShotList extends StatelessWidget {
  const ScreenShotList({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(

      child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){

            return   ClipRRect(borderRadius: BorderRadius.circular(16),child: Image.asset(ImageApp.byDetails,fit: BoxFit.cover,),);

          }, separatorBuilder: (constext, index){return SizedBox(height: 15,);}, itemCount: 3),
    );
  }
}
