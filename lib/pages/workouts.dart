import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:three_d_yoga/pages/one_workout.dart';
import 'package:three_d_yoga/widgets/text_elements/big_text.dart';
import 'package:three_d_yoga/widgets/drawer.dart';
import 'package:three_d_yoga/widgets/one_card.dart';

import '../model/model.dart';
import '../services/db.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/appbar.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {

  late String _workout;
  List<Workout> _workouts = [];

  Widget format(Workout w) {
    return OneCard(
        title: w.name,
        description: w.description
    );
  }

  List<Widget> get _items => _workouts.map((e) => format(e)).toList();

  final searchField = TextFormField(
    decoration: const InputDecoration(
        hintText: "Введите название"
    ),
  );


  @override
  void initState() {
    refresh();
    super.initState();
  }

  void refresh() async {
    List<Map<String, dynamic>> _res = await DB.query(Workout.table);
    _workouts = _res.map((e) => Workout.fromMap(e)).toList();
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    //List<Map> workouts = List.generate(10, (index) => {"id": index, "name": "Тренировка $index"}).toList();

    return Scaffold(
        appBar: const MyAppBar(),
        body: Column(
          children: [
            SizedBox(height: Dimensions.height20,),
            BigText(text: "Тренировки"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Введите название"),
                SizedBox(width: 30,),
                Icon(Icons.search)
              ],
            ),
            SizedBox(height: Dimensions.height20,),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
                  itemCount: _items.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OneWorkout(id: index)),
                          );
                        },
                        child: _items[index]
                    );
                  }),
            ),
          ],
        ),
      drawer: MyDrawer()
    );
  }
}
