import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:moves_final_project/core/resources/auto_route.gr.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/firebase_functions.dart';
import 'package:moves_final_project/features/auth/presentation/login_screen.dart';
import 'package:moves_final_project/features/home/presentation/provider/UserProvider.dart';
import 'package:moves_final_project/features/edit_profil/presentation/screen/Edit%20profile.dart';
import 'package:moves_final_project/features/home/presentation/widget/card_item.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileTab> {
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<UserProvider>(context, listen: false).loadUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        var user = userProvider.user;

        if (user == null) {
          return const Scaffold(
            backgroundColor: Color(0xFF1E1E1E),
            body: Center(
              child: CircularProgressIndicator(
                color: ColorsApp.primaryGold,
              ),
            ),
          );
        }

        return Scaffold(
          backgroundColor: const Color(0xFF1E1E1E),
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey[800],
                            backgroundImage:
                            user.avatar.isNotEmpty &&
                                user.avatar.contains('assets')
                                ? AssetImage(user.avatar)
                                : null,
                            child:
                            user.avatar.isEmpty ||
                                !user.avatar.contains('assets')
                                ? const Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.white,
                            )
                                : null,
                          ),

                          const SizedBox(height: 10),

                          Text(
                            user.name ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          _buildStatColumn(
                            user.watchList.length.toString(),
                            "Wish List",
                          ),
                          const SizedBox(width: 30),
                          _buildStatColumn(
                            user.history.length.toString(),
                            "History",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const UpdateProfileScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 15),

                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            FirebaseFunctions.signOut();
                            context.pushRoute(LoginRoute());

                          },
                          icon: const Icon(
                            Icons.exit_to_app,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Exit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),


                Row(
                  children: [
                    _buildTabButton(0, "Watch List", Icons.list),
                    _buildTabButton(1, "History", Icons.folder),
                  ],
                ),

                Container(height: 1, color: Colors.grey[800]),


                Expanded(
                  child:
                  _selectedTabIndex == 0
                      ? _buildMoviesGrid(user.watchList)
                      : _buildMoviesGrid(user.history),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.white70)),
      ],
    );
  }

  Widget _buildTabButton(int index, String title, IconData icon) {
    bool isSelected = _selectedTabIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTabIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? Colors.amber : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: isSelected ? Colors.amber : Colors.white70),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.amber : Colors.white70,
                  fontWeight:
                  isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoviesGrid(List<dynamic> moviesList) {
    if (moviesList.isEmpty) {
      return const Center(
        child: Icon(
          Icons.movie_creation_outlined,
          size: 80,
          color: Colors.grey,
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: moviesList.length,
      itemBuilder: (context, index) {
        return CardItem(
            id: moviesList[index]['id'],
            width: 0.37,
            rating:(moviesList[index]['rating'] ?? 0).toDouble(),
            imageUrl: moviesList[index]['poster']);
      },
    );
  }
}