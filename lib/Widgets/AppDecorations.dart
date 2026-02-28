import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDecorations {

  static InputDecoration customInputDecoration({
    required String hintText,
    required Widget iconWidget,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.white54),
      filled: true,
      fillColor: const Color(0xFF2A2A2A),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12.0),
        child: iconWidget,
      ),
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
    );
  }
}