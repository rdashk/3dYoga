import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_d_yoga/model/model.dart';
import 'package:three_d_yoga/pages/age.dart';
import 'package:three_d_yoga/pages/one_workout.dart';
import 'package:three_d_yoga/pages/personal_account.dart';
import 'package:three_d_yoga/pages/sign_in.dart';
import 'package:three_d_yoga/pages/sign_up.dart';
import 'package:three_d_yoga/pages/workouts.dart';
import 'package:three_d_yoga/services/db.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DB.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: WorkoutPage(),
      routes: {
        '/signup': (context) => SignUp(),
        '/signin': (context) => SignIn(),
        '/oneworkout': (context) => OneWorkout(id: 1),
        '/workouts': (context) => const WorkoutPage(),
        '/account': (context) => PersonalAccount()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
