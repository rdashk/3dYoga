import 'package:flutter/cupertino.dart';
import 'package:three_d_yoga/utils/dimensions.dart';
import 'package:three_d_yoga/widgets/text_elements/title_card.dart';

import '../utils/colors.dart';
import 'text_elements/description_card.dart';

class OneCard extends StatelessWidget {

  final String title;
  final String description;
  OneCard({Key? key, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.backColor,
        borderRadius: BorderRadius.circular(Dimensions.radius20),
      ),
      child: Column(
        children: [
          TitleCard(text: title),
          DescriptionCard(text: description)
        ],
      ),
    );
  }
}
