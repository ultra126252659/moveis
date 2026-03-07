
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moves_final_project/Widgets/AppDecorations.dart';

import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/firebase_functions.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';


@RoutePage()
class ResetPasswordScreen extends StatelessWidget {
  static const String routeName = "ResetPassword";

  ResetPasswordScreen({super.key});

  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,


      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color:ColorsApp.background),
        centerTitle: true,
        title: Text(
          AppString.hintTextForgetPassword,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color:ColorsApp.background,
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
                height: 450,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 40),


              TextFormField(
                controller: emailController,
                style: const TextStyle(color: ColorsApp.background),
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
                      backgroundColor:ColorsApp.background,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:ColorsApp.primaryGold,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  AppString.textVerifyEmail,
                  style: GoogleFonts.poppins(
                    color:ColorsApp.background,
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