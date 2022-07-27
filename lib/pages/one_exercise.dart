import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:get/get.dart';
import 'package:three_d_yoga/widgets/appbar.dart';

class OneExercise extends StatefulWidget {
  const OneExercise({Key? key}) : super(key: key);

  @override
  State<OneExercise> createState() => _OneExerciseState();
}

class _OneExerciseState extends State<OneExercise> {
  late Object naryto;
  @override
  void initState() {
    naryto = Object(fileName: "assets/naryto/nn.obj");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: Center(
          child: Cube(
            onSceneCreated: (Scene scene) {
              scene.world.add(naryto);
              scene.camera.zoom = 10;
            },
          ),
        )
    );
  }
}
