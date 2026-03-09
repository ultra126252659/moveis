import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AvatarBottomSheetHelper {

  static void show({
    required BuildContext context,
    required List<String> avatars,
    required String currentAvatarPath,
    required Function(String) onAvatarSelected,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF282A28),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Choose Avatar",
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: avatars.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // هنا بنبعت مسار الصورة الجديد للشاشة الأساسية عشان هي اللي تعمل setState
                      onAvatarSelected(avatars[index]);
                      Navigator.pop(context); // بنقفل القايمة
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: currentAvatarPath == avatars[index]
                              ? const Color(0xFFF6BD00)
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(avatars[index], fit: BoxFit.cover),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}