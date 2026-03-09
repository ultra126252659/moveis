import 'package:flutter/material.dart';

class AppDecorations {
  static InputDecoration customInputDecoration({required String hint, required IconData icon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white54),
      filled: true,
      fillColor: const Color(0xFF282A28),
      prefixIcon: Icon(icon, color: Colors.white54),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none
      ),
    );
  }
}
