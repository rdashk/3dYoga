import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  Color? color;
  final String text;

  SignButton({Key? key,
    this.color = const Color(0xffffffff),
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0, bottom: 30),
      child: ElevatedButton(
        onPressed: () {  },
        child: Text(
            text,
            style:TextStyle(
              color: Color(0xFF332d2b),
            )),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          padding: MaterialStateProperty.all(EdgeInsets.all(20)),
        ),
      ),
    );
  }
}
