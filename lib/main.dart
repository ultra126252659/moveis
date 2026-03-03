import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/di.dart';
<<<<<<< HEAD

=======
import 'package:moves_final_project/features/details/presentation/screen/movie_details_screen.dart';
import 'package:moves_final_project/features/home/presentation/screen/home_screen.dart';
>>>>>>> devAlaa

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context,child){
          return MaterialApp(
            debugShowCheckedModeBanner: false,

          );
      },
    );
  }
}


