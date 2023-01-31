import 'package:colette/screens/activities/registered_activities_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('RegisteredActivitiesBloc', () {
    late RegisteredActivitiesBloc registeredActivitiesBloc;

    setUp(() {
      registeredActivitiesBloc = RegisteredActivitiesBloc();
    });

    test('initial state', () {
      expect(registeredActivitiesBloc.state, <String>{});
    });

    blocTest<RegisteredActivitiesBloc, Set<String>>(
      'emits a set containing the id when ActivityRegistered is added',
      build: () => RegisteredActivitiesBloc(),
      act: (bloc) => bloc.add(ActivityRegistered("a")),
      expect: () => [
        {"a"}
      ],
    );
    
    blocTest<RegisteredActivitiesBloc, Set<String>>(
      'emits a set containing the id when ActivityRegistered is added',
      seed: () => {"a"},
      build: () => RegisteredActivitiesBloc(),
      act: (bloc) => bloc.add(ActivityUnregistered("a")),
      expect: () => [{}],
    );
  });
}
