import 'package:colette/screens/auth/auth_bloc.dart';
import 'package:colette/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const ColetteApp());
}

class ColetteApp extends StatelessWidget {
  const ColetteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colette Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (BuildContext context) => AuthBloc(),
          ),
        ],
        child: const AuthScreen(),
      ),
    );
  }
}
