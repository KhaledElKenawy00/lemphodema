import 'package:flutter/material.dart';
import 'package:lymphoedemo/constant/const.dart';
import 'package:lymphoedemo/constant/dimentions.dart';

class LegExersisePage extends StatelessWidget {
  final List<Map<String, String>> exerciseDetails = [
    {
      "title": "Exercise 1: Diaphragmatic Breathing",
      "reps": "Reps: 5–10",
      "description":
          "Lie on your back with your knees bent and your back in a neutral position (slightly arched).\n"
          "Place your hands on your stomach and concentrate on your breathing.\n"
          "Inhale while expanding your stomach without any trunk or chest movement and exhale without forcing.\n"
          "There should be a short pause after each exhale before the next inhale.",
      "image": "assets/icons/1.png",
    },
    {
      "title": "Exercise 2: Marching on the Spot",
      "reps": "Reps: 5–10",
      "description":
          "Stand up with your feet about hip width.\n"
          "March on the spot, lifting your knees high.\n"
          "Keep the body straight as you do the exercise.\n"
          "You can hold onto a stable object such as a chair for balance.",
      "image": "assets/icons/2.png",
    },
    {
      "title": "Exercise 3: Standing Knee Flexion",
      "reps": "Reps: 5–10",
      "description":
          "Stand on the uninvolved leg, using a chair to maintain your balance.\n"
          "Bend your knee up through the available range, keeping your knees together and without bending your hips.\n"
          "Return to the starting position and repeat.",
      "image": "assets/icons/3.png",
    },
    {
      "title": "Exercise 4: Seated Hip Flexion",
      "reps": "Reps: 5–10",
      "description":
          "Start by sitting upright in a chair.\n"
          "Slowly raise your leg up, then return to the start position and repeat.",
      "image": "assets/icons/4.png",
    },
    {
      "title": "Exercise 5: Knee Extension",
      "reps": "Reps: 5–10",
      "description":
          "Sit down on a chair with your back straight.\n"
          "Fully extend one leg then go down and repeat.",
      "image": "assets/icons/5.png",
    },
    {
      "title": "Exercise 6: Resisted Plantar Flexion",
      "reps": "Reps: 5–10",
      "description":
          "Sit straight on a chair with your feet flat on the floor.\n"
          "Flex the ankle to go on the tip of your toes, raising the heel off the ground.\n"
          "Lower and repeat.",
      "image": "assets/icons/6.png",
    },
    {
      "title": "Exercise 7: Toes Extension",
      "reps": "Reps: 5–10",
      "description":
          "Lift your toes up towards you as far as you can.\n"
          "Relax your toes and repeat.\n"
          "When you lift up your toes, keep your ankle in a relaxed position. Lift only your toes.",
      "image": "assets/icons/7.png",
    },
    {
      "title": "Exercise 8: Active Dorsiflexion/Plantar Flexion",
      "reps": "Reps: 5–10",
      "description":
          "Sit on a table or a firm bed with your legs straight and ankles over the edge.\n"
          "Perform dorsiflexion and plantar flexion alternately by bringing your toes toward you and away from you.",
      "image": "assets/icons/8.png",
    },
    {
      "title": "Exercise 9: Ankle Circumduction",
      "reps": "Reps: 5–10",
      "description":
          "Lie on your back or sit on a raised surface so that you can lift your feet off of the floor.\n"
          "Move your toes up, in, down, and out in order to form a circle with your foot.",
      "image": "assets/icons/9.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pColor,
      appBar: AppBar(
        title: Text("Leg Exercises"),
        backgroundColor: pColor,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(Dimentions.hightPercentage(context, 2)),
        itemCount: exerciseDetails.length,
        itemBuilder: (context, index) {
          final exercise = exerciseDetails[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                Dimentions.hightPercentage(context, 2),
              ),
            ),
            elevation: 4,
            margin: EdgeInsets.only(
              bottom: Dimentions.hightPercentage(context, 2),
            ),
            child: Padding(
              padding: EdgeInsets.all(Dimentions.hightPercentage(context, 2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exercise["title"]!,
                    style: TextStyle(
                      fontFamily: "Lemonada",
                      fontSize: Dimentions.fontPercentage(context, 3),
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: Dimentions.hightPercentage(context, 1.5)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(exercise["image"]!, fit: BoxFit.cover),
                  ),
                  SizedBox(height: Dimentions.hightPercentage(context, 1)),
                  Text(
                    exercise["reps"]!,
                    style: TextStyle(
                      fontFamily: "Lemonada",
                      fontSize: Dimentions.fontPercentage(context, 2.6),
                      fontWeight: FontWeight.w600,
                      color: Colors.teal.shade900,
                    ),
                  ),
                  SizedBox(height: Dimentions.hightPercentage(context, 1)),
                  Text(
                    exercise["description"]!,
                    style: TextStyle(
                      fontFamily: "Lemonada",
                      fontSize: Dimentions.fontPercentage(context, 2.4),
                      fontStyle: FontStyle.italic,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
