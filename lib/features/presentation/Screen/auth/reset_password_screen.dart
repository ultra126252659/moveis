
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moves_final_project/Widgets/AppDecorations.dart';
import 'package:moves_final_project/core/App%20Colors.dart';
import 'package:moves_final_project/core/AppString.dart';
import 'package:moves_final_project/core/ImageApp.dart';
import 'package:moves_final_project/core/firebase_functions.dart';



class ResetPasswordScreen extends StatelessWidget {
  static const String routeName = "ResetPassword";

  ResetPasswordScreen({super.key});

  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.BackgroundDark,


      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Appcolors.primary),
        centerTitle: true,
        title: Text(
          AppString.hintTextForgetPassword,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Appcolors.primary,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),

              Image.asset(
                ImageApp.imageForgotpassword,
                height: 250,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 40),


              TextFormField(
                controller: emailController,
                style: const TextStyle(color: Appcolors.white),
                decoration: AppDecorations.customInputDecoration(
                  hintText: AppString.hintTextEmail,
                  iconWidget: Image.asset(ImageApp.imageEmail, width: 20, color: Colors.white54),
                ),
              ),

              const SizedBox(height: 24),


              ElevatedButton(
                onPressed: () {

                  FirebaseFunctions.resetPassword(emailController.text);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Password reset email sent. Please check your inbox."),
                      backgroundColor: Appcolors.success,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  AppString.TextVerifyEmail,
                  style: GoogleFonts.poppins(
                    color: Appcolors.BackgroundDark,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}