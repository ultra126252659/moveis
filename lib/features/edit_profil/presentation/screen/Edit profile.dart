import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/features/auth/presentation/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:moves_final_project/core/resources/firebase_functions.dart';
// اتأكد إن مسار الـ UserProvider بتاعك صح
import 'package:moves_final_project/features/home/presentation/provider/UserProvider.dart';

import '../widget/_customDecoration.dart';
import '../widget/showAvatarBottomSheet.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const String routeName = "UpdateProfile";

  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  String _selectedAvatarPath = "";
  bool _isLoading = false;
   List<String> avatars = [
    "assets/images/avatar1.png",
    "assets/images/avatar2.png",
    "assets/images/avatar3.png",
    "assets/images/avatar4.png",
    "assets/images/avatar5.png",
    "assets/images/avatar6.png",
    "assets/images/avatar7.png",
  ];

  @override
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var user = Provider.of<UserProvider>(context, listen: false).user;
      if (user != null) {
        nameController.text = user.name;
        phoneController.text = user.phone;
        setState(() {
          _selectedAvatarPath = user.avatar;
        });
      }
    });

    nameController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => UserProvider()..loadUserData(),
        child:Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              var user = userProvider.user;
              return Scaffold(
                backgroundColor: const Color(0xFF121212),
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon:  Icon(Icons.arrow_back, color: Color(0xFFF6BD00)),
                    onPressed: () => Navigator.pop(context),
                  ),
                  title: Text(
                    "Edit Profile",
                    style: GoogleFonts.poppins(color: ColorsApp.primaryGold,
                        fontWeight: FontWeight.w600),
                  ),
                  centerTitle: true,
                ),
                body: _isLoading
                    ? const Center(child: CircularProgressIndicator(color: Color(0xFFF6BD00)))
                    : SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            AvatarBottomSheetHelper.show(
                              context: context,
                              avatars: avatars,
                              currentAvatarPath: _selectedAvatarPath,
                              onAvatarSelected: (newAvatar) {
                                setState(() {
                                  _selectedAvatarPath = newAvatar;
                                });
                              },
                            );
                          },
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.grey[800],
                                backgroundImage: AssetImage(_selectedAvatarPath),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF6BD00),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.edit, color: Colors.black, size: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),

                      TextFormField(
                        controller: nameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: AppDecorations.customInputDecoration( hint: 'Name', icon: Icons.person),
                      ),
                      const SizedBox(height: 16),

                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(color: Colors.white),
                        decoration:  AppDecorations.customInputDecoration(hint: "Phone Number", icon:Icons.phone),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () async {
                            var userProvider = Provider.of<UserProvider>(context, listen: false);
                            String? userEmail = userProvider.user?.email;

                            if (userEmail != null && userEmail.isNotEmpty) {
                              try {
                                await FirebaseFunctions.resetPassword(userEmail);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Password reset link sent to: $userEmail", style: const TextStyle(color: Colors.white)),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text("Error sending reset link. Please try again.", style: TextStyle(color: Colors.white)),
                                    backgroundColor: Colors.redAccent,
                                  ),
                                );
                              }
                            }
                          },
                          child: Text(
                            "Reset Password",
                            style: GoogleFonts.poppins(color: Colors.white70, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: const Color(0xFF282A28),
                              title: const Text("Delete Account", style: TextStyle(color: Colors.redAccent)),
                              content: const Text("هل أنت متأكد من مسح الحساب نهائياً؟ لا يمكن التراجع عن هذه الخطوة.", style: TextStyle(color: Colors.white)),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("Cancel", style: TextStyle(color: Colors.white54)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    FirebaseFunctions.deleteAccount(
                                      onSuccess: () {
                                        Navigator.pop(context);
                                        Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
                                      },
                                      onError: (error) {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error), backgroundColor: Colors.red));
                                      },
                                    );
                                  },
                                  child: const Text("Delete", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text("Delete Account", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () => _updateProfileData(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF6BD00),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Text("Update Data", style: GoogleFonts.poppins(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            }));
  }
  void _updateProfileData(BuildContext providerContext) {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    var currentUser = userProvider.user!;

    currentUser.name = nameController.text;
    currentUser.phone = phoneController.text;
    currentUser.avatar = _selectedAvatarPath;

    // بنحدث الداتا محلياً في ثانية
    userProvider.refreshUserLocally();
    Navigator.pop(context);

    // الرفع لفايربيز في الخلفية
    FirebaseFunctions.updateUserData(
      currentUser,
      onSuccess: () {},
      onError: (error) {},
    );
  }
}