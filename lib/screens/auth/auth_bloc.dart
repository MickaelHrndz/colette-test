import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthenticationState { unknown, authenticated, unauthenticated }

abstract class AuthEvent {}

class LogInAttempt extends AuthEvent {}

class AuthBloc extends Bloc<AuthEvent, AuthenticationState> {
  AuthBloc() : super(AuthenticationState.unknown) {
    on<LogInAttempt>((event, emit) => emit(AuthenticationState.authenticated));
  }
}
