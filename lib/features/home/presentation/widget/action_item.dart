
import 'package:flutter/material.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/core/resources/style_app.dart';

class ActionItem extends StatelessWidget {
  const ActionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppString.titleHome,
                style: StyleApp.mdText,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(AppString.supTitleHome,
                      style: StyleApp.smText.copyWith(
                          color: ColorsApp.primaryGold),
                    ),
                    Icon(Icons.arrow_forward, color: ColorsApp.primaryGold,)]
                ),
              )
            ]
          ),
        ),
        Container(
          height: 230,
          child: ListView.builder(

            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.37,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          ImageApp.bgHome,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(

                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          height: 30,
                          width: 65,
                          decoration: BoxDecoration(
                            color: ColorsApp.shadow.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("7.7", style: StyleApp.smText,),
                                Icon(Icons.star, color: ColorsApp.primaryGold,),
                              ]
                          )
                      )
                    ],
                  )
              );
            }
          ),
        )
      ],
    );
  }
}
