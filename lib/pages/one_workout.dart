import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:three_d_yoga/utils/dimensions.dart';
import 'package:three_d_yoga/widgets/appbar.dart';
import 'package:three_d_yoga/pages/one_exercise.dart';
import 'package:three_d_yoga/widgets/text_elements/big_text.dart';
import 'package:three_d_yoga/widgets/drawer.dart';
import 'package:three_d_yoga/widgets/text_elements/title_card.dart';
import 'package:three_d_yoga/widgets/video.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class OneWorkout extends StatefulWidget {
  final int id;
  OneWorkout({Key? key, required this.id}) : super(key: key);

  @override
  State<OneWorkout> createState() => _OneWorkoutState();
}

class _OneWorkoutState extends State<OneWorkout> {

  @override
  Widget build(BuildContext context) {
    List<Map> exercises = List.generate(7, (index) => {"id": index, "name": "Упражнение $index"}).toList();
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: Container(
        padding: EdgeInsets.only(
            top: Dimensions.height20,
            bottom: Dimensions.height20,
            right: Dimensions.width40,
            left: Dimensions.width40,),
        child:
          Column(
            children: [
              BigText(text: "Тренировка 1"),
              Text("\nОписание:\nДанная тренировка направлена на укрепление мышц спины...",),
              const VideoPlayerScreen(),
              const Text(
                "Упражнения:",
                maxLines: 1,
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: exercises.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OneExercise()),
                          );
                        },
                        child: Text(exercises[index]["name"])
                    );
                  },
                ),
              )
            ],
          ),
      ),
    );
  }
}