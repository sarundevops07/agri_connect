import 'package:flutter/material.dart';

import 'package:agri_connect/application/post/bloc/postcreation_bloc.dart';
import 'package:agri_connect/application/auth_screen/bloc/authscreen_bloc.dart';
import 'package:agri_connect/config/routes.dart';
import 'package:agri_connect/dependency_injection/di.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (ctx) => getIt<AuthscreenBloc>(),
          ),
          BlocProvider(
            create: (ctx) => getIt<PostcreationBloc>(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: goRouter,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 200, 230, 201)),
            useMaterial3: true,
          ),
        ));
  }
}
