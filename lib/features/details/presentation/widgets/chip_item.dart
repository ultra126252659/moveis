import 'package:flutter/material.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';

class ChipItem extends StatelessWidget {
  num count;
  String icon;
   ChipItem({super.key, required this.count, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: ColorsApp.textMuted,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageIcon(
            AssetImage(icon),
            color: ColorsApp.primaryGold,
          ),
          SizedBox(width: 4),
          Text(
           " $count",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
