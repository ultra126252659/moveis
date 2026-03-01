import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';

class StyleApp {
  static TextStyle smText = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ColorsApp.textPrimary
  );
  static TextStyle mdText = GoogleFonts.poppins(
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: ColorsApp.textPrimary
  );
  static TextStyle lgText = GoogleFonts.poppins(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: ColorsApp.textPrimary
  );
}