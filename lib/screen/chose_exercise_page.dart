import 'package:flutter/material.dart';
import 'package:lymphoedemo/constant/const.dart';
import 'package:lymphoedemo/constant/dimentions.dart';
import 'package:lymphoedemo/screen/arm_exercise_page.dart';
import 'package:lymphoedemo/screen/leg_exersise_page.dart';

class ChoseExercisePage extends StatelessWidget {
  const ChoseExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pColor,
      appBar: AppBar(title: Text("Exercise Page"), backgroundColor: pColor),
      body: Column(
        children: [
          SizedBox(height: Dimentions.hightPercentage(context, 10)),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LegExersisePage()),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: Dimentions.hightPercentage(context, 1.5),
                  horizontal: Dimentions.hightPercentage(context, 2),
                ),
                height: Dimentions.hightPercentage(context, 20),
                width: Dimentions.hightPercentage(context, 20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(
                    Dimentions.hightPercentage(context, 2),
                  ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Image.asset("assets/leg.png")],
                ),
              ),
            ),
          ),

          SizedBox(height: Dimentions.hightPercentage(context, 2)),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArmExercisesPage()),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: Dimentions.hightPercentage(context, 1.5),
                  horizontal: Dimentions.hightPercentage(context, 2),
                ),
                height: Dimentions.hightPercentage(context, 20),
                width: Dimentions.hightPercentage(context, 20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(
                    Dimentions.hightPercentage(context, 2),
                  ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Image.asset("assets/arm.png")],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
