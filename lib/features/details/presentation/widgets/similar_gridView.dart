

import 'package:flutter/material.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';

class CusctomGridView extends StatelessWidget {
  const CusctomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return     SizedBox(
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2/3,mainAxisSpacing: 37,crossAxisSpacing: 37) ,itemCount:4, itemBuilder: (context, index){


        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                ImageApp.bgHome,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(18, 19, 18, 0.71),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '4.5',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(width: 4),
                    ImageIcon(
                      AssetImage(IconApp.star),
                      color: ColorsApp.primaryGold,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}