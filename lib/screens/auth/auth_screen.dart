import 'package:colette/screens/activities/activities_screen.dart';
import 'package:colette/screens/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthenticationState>(
        listener: (context, state) {
          if (state == AuthenticationState.authenticated) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Logged in successfully"),
              duration: Duration(seconds: 2),
            ));
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const ActivitiesScreen()));
          }
        },
        child: Scaffold(
          body: Center(
              child: ElevatedButton(
            child: const Text("Log in"),
            onPressed: () => context.read<AuthBloc>().add(LogInAttempt()),
          )),
        ));
  }
}
