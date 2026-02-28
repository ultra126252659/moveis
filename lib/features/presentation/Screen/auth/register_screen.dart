import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moves_final_project/Widgets/AppDecorations.dart';
import 'package:moves_final_project/core/AppString.dart';
import 'package:provider/provider.dart';

import 'package:moves_final_project/core/firebase_functions.dart';
import 'package:moves_final_project/features/presentation/providers/auth_provider.dart';
import 'login_screen.dart';


class RegisterScreen extends StatefulWidget {
  static const String routeName = "Register";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();


  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(viewportFraction: 0.4, initialPage: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);


    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: ()
                       {
                         Navigator.pop(context);
                       },
                     icon: Icon(Icons.arrow_back, color: Color(0xFFF6BD00)),
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            AppString.TextRegister,
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFF6BD00),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                  const SizedBox(height: 30),


                  SizedBox(
                    height: 140,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: authProvider.avatars.length,
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (index) {
                        authProvider.changeAvatar(index);
                      },
                      itemBuilder: (context, index) {
                        bool isSelected = authProvider.selectedAvatarIndex ==
                            index;
                        return GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: AnimatedScale(
                            duration: const Duration(milliseconds: 300),
                            scale: isSelected ? 1.0 : 0.65,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 300),
                              opacity: isSelected ? 1.0 : 0.6,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        authProvider.avatars[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Text(
                      AppString.TextAvatar,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),


                  TextFormField(
                    controller: nameController,
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Please enter your name";
                      return null;
                    },
                    decoration:AppDecorations.customInputDecoration(
                      hintText: "Name",
                      iconWidget: const Icon(
                          Icons.badge_outlined, color: Colors.white54),
                    ),
                  ),
                  const SizedBox(height: 16),


                  TextFormField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Please enter your Email";
                      final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(value);
                      if (!emailValid) return "Please enter a valid email";
                      return null;
                    },
                    decoration: AppDecorations.customInputDecoration(
                      hintText: "Email",
                      iconWidget: Image.asset(
                          "assets/images/Email.png", width: 20,
                          color: Colors.white54),
                    ),
                  ),
                  const SizedBox(height: 16),


                  TextFormField(
                    controller: passwordController,
                    obscureText: !isPasswordVisible,
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Please enter your Password";
                      return null;
                    },
                    decoration: AppDecorations.customInputDecoration(
                      hintText: "Password",
                      iconWidget: Image.asset(
                          "assets/images/Password.png", width: 20,
                          color: Colors.white54),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible ? Icons.visibility : Icons
                              .visibility_off,
                          color: Colors.white54,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: !isConfirmPasswordVisible,
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Please enter your rePassword";
                      if (value != passwordController.text)
                        return "Password not matched";
                      return null;
                    },
                    decoration: AppDecorations.customInputDecoration(
                      hintText: "Confirm Password",
                      iconWidget: Image.asset(
                          "assets/images/Password.png", width: 20,
                          color: Colors.white54),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isConfirmPasswordVisible ? Icons.visibility : Icons
                              .visibility_off,
                          color: Colors.white54,
                        ),
                        onPressed: () {
                          setState(() {
                            isConfirmPasswordVisible =
                            !isConfirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),


                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Please enter your Phone Number";
                      return null;
                    },
                    decoration: AppDecorations.customInputDecoration(
                      hintText: "Phone Number",
                      iconWidget: const Icon(
                          Icons.phone, color: Colors.white54),
                    ),
                  ),
                  const SizedBox(height: 32),


                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        FirebaseFunctions.createUser(
                          emailController.text,
                          passwordController.text,
                          nameController.text,
                          phoneController.text,
                          authProvider.selectedAvatarPath,
                          onSuccess: () {
                            Navigator.pushReplacementNamed(
                              context,
                              LoginScreen.routeName,
                            );
                          },
                          onError: (message) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  message,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.redAccent,
                              ),
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF6BD00),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      "Create Account",
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
                        "Already Have Account ? ",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            LoginScreen.routeName,
                          );
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF6BD00),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Color(0xFFF6BD00), width: 2),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFF6BD00),
                              ),
                              child: Image.asset(
                                  "assets/images/En.png", width: 24,
                                  height: 24),
                            ),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                              ),
                              child: Image.asset(
                                  "assets/images/EG.png", width: 24,
                                  height: 24),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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