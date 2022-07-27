import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:three_d_yoga/utils/dimensions.dart';

import '../pages/personal_account.dart';
import '../pages/workouts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      width: MediaQuery.of(context).size.width<300?MediaQuery.of(context).size.width/4 : 200,
        child : Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              children : [
                Container(
                  child: Column(
                    children: [
                      Icon(Icons.account_circle_rounded,),
                      Text("Имя Фамилия"),
                      Text("login")
                    ],
                  ),
                ),
                Divider(),
                Row(
                  children: [
                    Icon(Icons.account_circle_rounded),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PersonalAccount()),
                          );
                        },
                        child: Text("Личный кабинет"))
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.favorite_border),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WorkoutPage()),
                          );
                        },
                        child: Text("Избранное"))
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.search),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WorkoutPage()),
                          );
                        },
                        child: Text("Навигация"))
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.feedback_outlined),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PersonalAccount()),
                          );
                        },
                        child: Text("Обратная связь"))
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height<300?MediaQuery.of(context).size.width/4 : 200),
                Row(
                  children: [
                    Icon(Icons.settings),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PersonalAccount()),
                          );
                        },
                        child: Text("Настройки"))
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    TextButton(
                        onPressed: () {
                          //TODO: выход из текущего аккаунта
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WorkoutPage()),
                          );
                        },
                        child: Text("Выход"))
                  ],
                )
              ]
          ),
        )
    );
  }
}
