
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/firebase_functions.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/features/auth/presentation/register_screen.dart';
import 'package:moves_final_project/features/auth/presentation/reset_password_screen.dart';
import 'package:moves_final_project/features/auth/providers/auth_provider.dart';

import 'package:provider/provider.dart';



class LoginScreen extends StatefulWidget {
  static const String routeName = "Login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);




    return Scaffold(
      backgroundColor: ColorsApp.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  Image.asset(ImageApp.bgHome, height: 120),
                  const SizedBox(height: 50),


                  TextFormField(
                    controller: emailController,
                    style: const TextStyle(color:ColorsApp.background),
                    decoration: InputDecoration(
                      hintText: AppString.titleHome,
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white54,
                      ),
                      filled: true,
                      fillColor: const Color(0xFF282A28),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(ImageApp.byDetails, width: 20, color: ColorsApp.background),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),


                  TextFormField(
                    controller: passwordController,
                    obscureText: !isPasswordVisible,
                    style: const TextStyle(color: ColorsApp.background),
                    decoration: InputDecoration(
                      hintText: AppString.subTitleDetailsScreenShots,
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white54,
                      ),
                      filled: true,
                      fillColor: const Color(0xFF282A28),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(ImageApp.byDetails, width: 20, color: Colors.white),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white54,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),


                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          ResetPasswordScreen.routeName,
                        );
                      },
                      child: Text(
                       AppString.simialr,
                        style: GoogleFonts.poppins(
                          color: ColorsApp.background,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),


                  ElevatedButton(
                    onPressed: () {
                      FirebaseFunctions.login(
                        emailController.text,
                        passwordController.text,
                           onSuccess: () {
                          authProvider.initUser();
                          /*Navigator.pushReplacementNamed(
                            context,
                           // HomeScreen.routeName,
                          );*/
                        },
                        onError: (message) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                message,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:ColorsApp.background,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      AppString.titleHome,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF121212),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppString.titleHome,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                       onTap: () {
                          Navigator.pushNamed(
                            context,
                            RegisterScreen.routeName,
                          );
                        },
                        child: Text(
                         AppString.titleHome,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorsApp.background,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color:ColorsApp.background,
                          thickness: 1,
                          endIndent: 16,
                          indent: 32,
                        ),
                      ),
                      Text(
                        AppString.titleHome,
                        style: GoogleFonts.poppins(
                          color:ColorsApp.background,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color:ColorsApp.background,
                          thickness: 1,
                          indent: 16,
                          endIndent: 32,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // زر تسجيل الدخول باستخدام جوجل
                  ElevatedButton.icon(
                    onPressed: () {
                      // كود جوجل هنا
                    },
                    icon: Image.asset(ImageApp.bgHome, height: 24),
                    label: Text(
                     AppString.titleHome,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF121212),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:ColorsApp.background,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),


                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}