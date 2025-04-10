import 'package:flutter/material.dart';
import 'package:lymphoedemo/constant/const.dart';
import 'package:lymphoedemo/constant/dimentions.dart';

class ArmExercisesPage extends StatelessWidget {
  final List<Map<String, String>> exercises = [
    {
      "title": "1.Diaphragmatic breathing",
      "description":
          "Reps: 5-10\nLie on your back with your knees bent and your back in neutral position (slightly arched).\nPlace your hands on your stomach and concentrate on your breathing.\nInhale while expanding your stomach without any trunk or chest movement and exhale without forcing.\nThere should be a short pause after each exhale before the next inhale.",
      "image": "assets/1a.png",
    },
    {
      "title": "2.Neck rotation",
      "description":
          "Reps: 5-10\nStand or sit tall and tuck your chin inward and pull yourself up as if there is a rope pulling the back of your head upward.\nTurn your head to one side to look over your shoulder.\nReturn to the center then look to the other side.\nReturn to the center and repeat.",
      "image": "assets/2a.png",
    },
    {
      "title": "3.Neck side bending",
      "description":
          "Reps: 5-1\nTuck your chin inward and pull yourself up as if there is a rope pulling the back of your head upward.\nWithout turning the head, tilt your head sideways to bring your ear to your shoulder.\nReturn to neutral position, then bend your head to the other side.\nReturn to the starting position and repeat.",
      "image": "assets/3a.png",
    },
    {
      "title": "4.Shoulder shrugs",
      "description":
          "Reps: 5-10 Weight: 0-2 lbs\nStand or sit up tall with arms on your sides.\nShrug your shoulders forward, then lower them to the starting.",
      "image": "assets/4a.png",
    },
    {
      "title": "5.Elbow flexion",
      "description":
          "Reps: 5-10 Weight: 0-2 lbs\nStanding or sitting with your arm against your side and the palm facing inward, bend your elbow upward turning the palm up as you progress.\nLower slowly to the starting position and repeat.\nThis can be done with or without a light weight (1-2 lbs).",
      "image": "assets/5a.png",
    },
    {
      "title": "6.Elbow extension",
      "description":
          "Reps: 5-10 Weight: 0-2 lbs\nLie on your back with your upper arm vertical and your elbow bent. Stabilize your arm with your free hand.\nStraighten your elbow without moving the upper arm.\nBend the elbow under control and repeat.\nThis can be done with or without a light weight (1-2 lbs).",
      "image": "assets/6a.png",
    },
    {
      "title": "7.Shoulder flexion",
      "description":
          "Reps: 5-10 Weight: 0-2 lbs\nStand or sit up straight in a chair and look directly ahead of you.\nRaise your arm in front of you with your elbow straight, as high as you can.\nReturn your arm to the original position.\nDo not shrug your shoulder or arch your back. Move only your arm.\nThis can be done with or without a light weight (1-2 lbs).",
      "image": "assets/7a.png",
    },
    {
      "title": "8.Shoulder abduction",
      "description":
          "Reps: 5-10 Weight: 0-2 lbs\nStand or sit in a good upright posture.\nEngage your lower core muscles to keep the trunk and low back in neutral.\nSlowly and under control, with the thumb up, lift one arm up sideways toward your head, then back down again, making sure that the neck, trunk and low back remain in neutral.\nThis can be done with or without a light weight (1-2 lbs).",
      "image": "assets/8a.png",
    },
    {
      "title": "9.Horizontal Adduction",
      "description":
          "Reps: 5-10 Weight: 0-2 lbs\nLie on your back.\nRaise your arm in front of you and have your palms facing each other.\nKeep your elbows slightly bent while you lower your arms on each side.\nReturn to the starting position and repeat.\nThis can be done with or without a light weight (1-2 lbs).",
      "image": "assets/9a.png",
    },
    {
      "title": "10.Hand squeeze",
      "description":
          "Reps: 5-10\nPlace the palms of your hands together in front of you.\nPush your palms together.\nRelax your arms and repeat.",
      "image": "assets/10a.png",
    },
    {
      "title": "11.Active wrist ext. & flex.",
      "description":
          "Reps: 5-10\nBegin with the forearm of your affected wrist on the table with your palm down and your wrist over the edge.\nExtend your wrist, bringing the back of the hand up towards you.\nReturn to the starting position and repeat.",
      "image": "assets/11a.png",
    },
    {
      "title": "12.Active hand pump",
      "description":
          "Reps: 5-10\nHold your hands in front with your fingers straight and spread apart.\nClose your hands into a fist and then open and spread your fingers.\nRepeat.",
      "image": "assets/12a.png",
    },
    {
      "title": "13.Ball squeeze",
      "description":
          "Reps: 5-10\nHold a small ball in your hand. Squeeze the ball and then release it in a pumping motion.",
      "image": "assets/13a.png",
    },
    {
      "title": "14.Cardio Exercise",
      "description":
          "Freq: 150 min per week or as able\nEngage in regular cardiovascular exercise such as swimming, walking, nordic pole walking, dance or cycling.",
      "image": "assets/14a.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pColor,
      appBar: AppBar(
        title: const Text('Arm Exercises'),
        centerTitle: true,
        backgroundColor: pColor,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(Dimentions.hightPercentage(context, 2)),
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
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
