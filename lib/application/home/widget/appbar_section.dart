import 'package:agri_connect/config/routes.dart';
import 'package:agri_connect/config/routes_name.dart';
import 'package:flutter/material.dart';

class AppBarSection extends StatelessWidget {
  final String username;

  const AppBarSection({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          goRouter.push(RoutesName.profilePage.path);
        },
        child: CircleAvatar(
            radius: 40,
            child: Image.asset("lib/images/round_profil_picture_after_.webp")),
      ),
      title: Row(
        children: [
          Text("Hello, $username"),
          IconButton(
            onPressed: () {
              goRouter.push(RoutesName.postCreationScreen.path);
            },
            icon: const Icon(
              Icons.add_a_photo_sharp,
              size: 35,
            ),
          ),
        ],
      ),
      trailing: Stack(
        children: [
          IconButton(
            onPressed: () {},
            icon:
                SizedBox(height: 25, child: Image.asset("lib/images/bell.png")),
          ),
          Positioned(
            right: 2,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
