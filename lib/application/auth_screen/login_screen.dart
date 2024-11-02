import 'dart:developer';

import 'package:agri_connect/application/auth_screen/bloc/authscreen_bloc.dart';
import 'package:agri_connect/config/routes.dart';
import 'package:agri_connect/config/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: BlocListener<AuthscreenBloc, AuthscreenState>(
        listener: (context, state) {
          if (state.loggedIn) {
            goRouter.pushReplacement(RoutesName.postListScreen.path);
          } else if (state.loginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    state.errorMessage ?? 'Login Failed. Please try again.'),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    login(context);
                  },
                  child: const Text('Log In'),
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  icon: const Icon(Icons.g_mobiledata),
                  label: const Text('Log In with Google'),
                  onPressed: () {
                    signInWithGoogle(context);
                  },
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    goRouter.go(RoutesName.signUp.path);
                  },
                  child: const Text('Don’t have an account? Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  login(BuildContext context) {
    log("login button pressed");
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;

      context
          .read<AuthscreenBloc>()
          .add(AuthscreenEvent.login(email, password));
    }
  }

  signInWithGoogle(BuildContext context) {
    context
        .read<AuthscreenBloc>()
        .add(const AuthscreenEvent.signInWithGoogle());
  }
}
