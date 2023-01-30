import 'package:colette/models/activity.dart';
import 'package:colette/screens/activities/registered_activities_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen(this.activity, {super.key});
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activity.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(activity.description),
          Text("${activity.attendeesCount} attendees"),
          Text("Start time : ${activity.startTime.toIso8601String()}"),
          BlocBuilder<RegisteredActivitiesBloc, Set<String>>(
              builder: (context, state) {
            bool isRegistered = state.contains(activity.id);
            return ElevatedButton(
              onPressed: () => context.read<RegisteredActivitiesBloc>().add(
                  isRegistered
                      ? ActivityUnregistered(activity.id)
                      : ActivityRegistered(activity.id)),
              child: Text(isRegistered ? "Unregister" : "Register"),
            );
          }),
        ],
      ),
    );
  }
}
