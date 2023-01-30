import 'package:colette/screens/auth/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('AuthBloc', () {
    late AuthBloc authBloc;

    setUp(() {
      authBloc = AuthBloc();
    });

    test('initial state', () {
      expect(authBloc.state, AuthenticationState.unknown);
    });

    blocTest<AuthBloc, AuthenticationState>(
      'emits AuthenticationState.authenticated when LogInAttempt is added',
      build: () => AuthBloc(),
      act: (bloc) => bloc.add(LogInAttempt()),
      expect: () => [AuthenticationState.authenticated],
    );
  });
}
