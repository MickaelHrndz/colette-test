import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RegisteredActivitiesEvent {}

class ActivityRegistered extends RegisteredActivitiesEvent {
  final String activityId;
  ActivityRegistered(this.activityId);
}

class ActivityUnregistered extends RegisteredActivitiesEvent {
  final String activityId;
  ActivityUnregistered(this.activityId);
}

class RegisteredActivitiesBloc
    extends Bloc<RegisteredActivitiesEvent, Set<String>> {
  RegisteredActivitiesBloc() : super({}) {
    on<ActivityRegistered>((event, emit) {
      if (!state.contains(event.activityId)) {
        emit({...state, event.activityId});
      }
    });
    on<ActivityUnregistered>((event, emit) {
      if (state.contains(event.activityId)) {
        emit({
          // keep any id that isn't the unregistered one
          for (var id in state)
            if (id != event.activityId) id
        });
      }
    });
  }
}
