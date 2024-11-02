import 'package:agri_connect/application/auth_screen/bloc/authscreen_bloc.dart';
import 'package:agri_connect/application/auth_screen/login_screen.dart';
import 'package:agri_connect/application/auth_screen/signup_screen.dart';
import 'package:agri_connect/application/home/home_screen.dart';
import 'package:agri_connect/application/post/post_creation_screen.dart';
import 'package:agri_connect/application/profile_page/profile_page.dart';
import 'package:agri_connect/config/routes_name.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  initialLocation: RoutesName.login.path,
  routes: [
    GoRoute(
      name: RoutesName.login.name,
      path: RoutesName.login.path,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      name: RoutesName.signUp.name,
      path: RoutesName.signUp.path,
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      name: RoutesName.postListScreen.name,
      path: RoutesName.postListScreen.path,
      builder: (context, state) => const PostListScreen(),
    ),
    GoRoute(
      name: RoutesName.postCreationScreen.name,
      path: RoutesName.postCreationScreen.path,
      builder: (context, state) => const PostCreationScreen(),
    ),
    GoRoute(
      name: RoutesName.profilePage.name,
      path: RoutesName.profilePage.path,
      builder: (context, state) => const ProfilePage(),
    ),
  ],
);
