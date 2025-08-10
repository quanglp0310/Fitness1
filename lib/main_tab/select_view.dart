import 'package:fitness2/common_widget/round_button.dart';
import 'package:fitness2/view/meal_planner/meal_planner_view.dart';
import 'package:fitness2/view/workout_tracker/workout_tracker_view.dart';
import 'package:flutter/material.dart';

class SelectView extends StatelessWidget {
  const SelectView({super.key});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(
              title: "Workout Tracker",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WorkoutTrackerView(),
                  ),
                );
              },
            ),

            const SizedBox(height: 15),

            RoundButton(
              title: "Meal Planner",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MealPlannerView(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
