import 'package:colette/activities.dart';
import 'package:colette/models/activity.dart';
import 'package:colette/screens/activities/registered_activities_bloc.dart';
import 'package:colette/screens/activity/activity_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<RegisteredActivitiesBloc, Set<String>>(
          builder: (context, state) =>
              Text("${state.length} registered activities"),
        ),
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final Activity item = activities[index];
          return ListTile(
            title: Text(item.title),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => ActivityScreen(item))),
          );
        },
      ),
    );
  }
}
