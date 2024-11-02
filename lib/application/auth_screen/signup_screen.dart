import 'package:agri_connect/application/auth_screen/bloc/authscreen_bloc.dart';
import 'package:agri_connect/config/routes.dart';
import 'package:agri_connect/config/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: BlocListener<AuthscreenBloc, AuthscreenState>(
        listener: (context, state) {
          if (state.loggedIn) {
            // Navigate to Login screen after successful sign-up
            goRouter.pushReplacement(RoutesName.login.path);
          } else if (state.loginError) {
            // Display error message
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Sign Up Failed. Please try again.')),
            );
          } else if (state.isLoading) {
            const Center(
              child: CircularProgressIndicator(),
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
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name can't be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
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
                    signUp(context);
                  },
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                    icon: const Icon(Icons.g_mobiledata),
                    label: const Text('Sign Up with Google'),
                    onPressed: () {
                      signInWithGoogle(context);
                    }),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    goRouter.go(RoutesName.login.path);
                  },
                  child: const Text('Already have an account? Log In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  signUp(BuildContext context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;
      final name = nameController.text;

      context
          .read<AuthscreenBloc>()
          .add(AuthscreenEvent.signUp(name, email, password));
    }
  }

  signInWithGoogle(BuildContext context) {
    context
        .read<AuthscreenBloc>()
        .add(const AuthscreenEvent.signInWithGoogle());
  }
}
