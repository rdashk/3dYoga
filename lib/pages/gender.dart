import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_d_yoga/pages/workouts.dart';
import 'package:three_d_yoga/utils/colors.dart';
import 'package:three_d_yoga/utils/dimensions.dart';
import 'package:three_d_yoga/widgets/text_elements/big_text.dart';

import 'age.dart';

class ChooseGender extends StatefulWidget {
  const ChooseGender({Key? key}) : super(key: key);

  @override
  State<ChooseGender> createState() => _State();
}

class _State extends State<ChooseGender> {

  var _radioValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BigText(text: "Выберете пол",),
            Row(
              children: [
                Column(
                  children: [
                    Image.asset("assets/images/female.png", height: 350,),
                    Text("Женский"),
                    Radio(value: 1, groupValue: _radioValue, onChanged: (int? value) {
                      setState(() {_radioValue = value!;});
                    })
                  ],
                ),
                Column(
                  children: [
                    Image.asset("assets/images/male.png", height: 350,),
                    Text("Мужской"),
                    Radio(value: 2, groupValue: _radioValue, onChanged: (int? value) {
                      setState(() {_radioValue = value!;});
                    })
                  ],
                )
              ],
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkoutPage()),
                  );
                },
                style: ButtonStyle(
                  alignment: Alignment.bottomRight,
                ),
                child: Text("Далее"))
          ],
        ),
      ),
    );
  }
}
