import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moves_final_project/Widgets/AppDecorations.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/auto_route.gr.dart';
import 'package:moves_final_project/core/resources/firebase_functions.dart';
import 'package:moves_final_project/features/auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {

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
  var nidController = TextEditingController();


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
                           "textRegister".tr(),
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
                    "textAvatar".tr(),
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
                      hintText: "textName".tr(),
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
                      hintText: "hintTextEmail".tr(),
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
                      hintText: "hintTextPassword".tr(),
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
                      hintText: "hintTextConfirm Password".tr(),
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
                      hintText: "hintTextPhoneNumber".tr(),
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
                          nidController.text,
                          authProvider.selectedAvatarPath,
                          phoneController.text,
                          onSuccess: () {
                            authProvider.initUser();
                            context.pushRoute(LoginRoute());
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
                      backgroundColor: const Color(0xFFF6BD00),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      "textCreateAccount".tr(),
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF121212),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "TextAlready Have Account ? ".tr(),
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushRoute(LoginRoute());
                        },
                        child: Text(
                          "hintTextLogin".tr(),
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF6BD00),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.w,
                        height: 45.h,
                        padding: EdgeInsets.all(2.r),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30.r),
                          border: Border.all(
                            color: Colors.amber,
                            width: 2.w,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.setLocale(const Locale("en", "US"));
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: context.locale.languageCode == "en"
                                      ? Colors.amber
                                      : Colors.transparent,
                                ),
                                padding: EdgeInsets.all(2.r),
                                child: const CircleAvatar(
                                  backgroundImage: AssetImage('assets/images/En.png'),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                context.setLocale(const Locale("ar", "EG"));
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: context.locale.languageCode == "ar"
                                      ? Colors.amber
                                      : Colors.transparent,
                                ),
                                padding: EdgeInsets.all(2.r),
                                child: const CircleAvatar(
                                  backgroundImage: AssetImage('assets/images/EG.png'),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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