import 'package:flutter/material.dart';

import '../../../utils/AppColors.dart';

class DashedLinesDecoration extends StatelessWidget {
  const DashedLinesDecoration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.darkBlack.withOpacity(.8),
            borderRadius: BorderRadius.circular(100),
          ),
          width: 60,
          height: 4,
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.darkBlack,
            borderRadius: BorderRadius.circular(100),
          ),
          width: 5,
          height: 5,
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.darkBlack,
            borderRadius: BorderRadius.circular(100),
          ),
          width: 5,
          height: 5,
        ),
      ],
    );
  }
}
