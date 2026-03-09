
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/firebase_functions.dart';
import 'package:moves_final_project/features/home/presentation/bloc/UserProvider.dart';
import 'package:provider/provider.dart';
import '../../../../core/resources/image&icon.dart';
import '../../../../core/resources/style_app.dart';
import '../widgets/cusotm_btn.dart';
import '../widgets/custom_list_of_chips.dart';
import '../widgets/screen_shot_list.dart';
import '../widgets/similar_gridView.dart';

class MovieDetailsScreen extends StatelessWidget {
    MovieDetailsScreen({super.key,required this.movie});
  final dynamic movie;
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    bool isWatched = userProvider.user!.history.any((element) => element['id'].toString() == movie.id.toString());
    bool isSaved = userProvider.user!.watchList.any((element) => element['id'].toString() == movie.id.toString());

    return Scaffold(
        backgroundColor: ColorsApp.background,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyActions: false,
          leadingWidth: 50,
         automaticallyImplyLeading: false,

          title: GestureDetector(onTap: (){
            Navigator.pop(context);
          },
              child: ImageIcon(AssetImage(IconApp.arrowBack),color: Colors.white,size: 24,)),
          actions: [
            IconButton(
              onPressed: () async {
                if (isSaved) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Movie is already saved! ", style: TextStyle(color: Colors.white)),
                      backgroundColor: Colors.orange,
                    ),
                  );
                  return;
                }

                Map<String, dynamic> movieData = {
                  "id": movie.id,
                  "title": movie.title,
                  "image": movie.mediumCoverImage,
                };

                await FirebaseFunctions.addToHistory(movieData);

                Provider.of<UserProvider>(context, listen: false).addMovieToHistoryLocally(movieData);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Added to History", style: TextStyle(color: Colors.white)),
                      backgroundColor: Colors.blue
                  ),
                );
              },
              icon: ImageIcon(
                AssetImage(IconApp.saveIc),
                color: isSaved ? Colors.amber : ColorsApp.textPrimary,
                size: 30,
              ),
            ),

            SizedBox(width: 15,)],),
        body: SingleChildScrollView(child: Column(

         crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(ImageApp.bgHome,width: 430.w,height: 630.h,fit: BoxFit.cover,),

              Center(
                child: Image.asset(ImageApp.play,width: 97.w,height: 97.h,),
              ),
              Positioned(
                  bottom: 100,
                  left: 16,
                  right: 16,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(textAlign: TextAlign.center,AppString.filmName,style: StyleApp.lgText,),
                  )),
              Positioned(
                  bottom: 60.sp,
                  left: 16,
                  right: 16,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(textAlign: TextAlign.center,
                      '2021',
                      style: StyleApp.lgText,),
                  )),
             ],
           ),
            CustomBtn(text: 'watch', onPressed: () {
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isWatched ? Colors.green : const Color(0xFFE50914),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  if (isWatched) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("You have already watched this movie! ", style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.orange,
                      ),
                    );
                    return;
                  }

                  Map<String, dynamic> movieData = {
                    "id": movie.id,
                    "title": movie.title,
                    "image": movie.mediumCoverImage,
                  };

                  await FirebaseFunctions.addToHistory(movieData);

                  Provider.of<UserProvider>(context, listen: false).addMovieToHistoryLocally(movieData);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Added to History successfully! ", style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.blue
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    isWatched ? "Watched ✓" : "Watch",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              );





            },),
           SizedBox(height: 15.h,),
            ChipsListCustom(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(AppString.subTitleDetailsScreenShots,style: StyleApp.lgText,),
            ),SizedBox(height: 1.h,),
            ScreenShotList(),
            SizedBox(height: 9.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(AppString.simialr,style: StyleApp.lgText,),
            ),SizedBox(height: 1.h,),
            CusctomGridView(),
            SizedBox(height: 9.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(AppString.summary,style: StyleApp.lgText,),
            ),SizedBox(height: 1.h,),
            Text(

                style:StyleApp.smText.copyWith(letterSpacing: 0) ,'Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346')
            ],)));
  }
}

