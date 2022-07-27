import 'package:flutter/cupertino.dart';

class TitleCard extends StatelessWidget {

  final String text;
  TitleCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
