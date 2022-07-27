import 'package:flutter/cupertino.dart';

import '../../utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  BigText({Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 30, bottom: Dimensions.height10),
        child: Text(
          text,
          maxLines: 1,
          style: TextStyle(
              color: color,
              fontWeight: FontWeight.w500,
              fontSize: size==0 ? Dimensions.font20:size,
          ),

        ),
      ),
    );
  }
}
