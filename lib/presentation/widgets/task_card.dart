import 'package:flutter/material.dart';
import 'package:uptodo_with_bloc/config/size_config.dart';
import 'package:uptodo_with_bloc/constants/colors.dart';
import 'package:uptodo_with_bloc/constants/text_styke.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.txt,
    required this.date,
  });
  final String txt;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        width: 327 * Sizeconfig.horizontalBlock,
        height: 72 * Sizeconfig.verticalBlock,
        decoration: BoxDecoration(
            color: kColor.card, borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: [
            Container(
              width: 16 * Sizeconfig.horizontalBlock,
              height: 16 * Sizeconfig.verticalBlock,
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.white),
                      right: BorderSide(color: Colors.white),
                      left: BorderSide(color: Colors.white),
                      bottom: BorderSide(color: Colors.white)),
                  shape: BoxShape.circle),
            ),
            SizedBox(width: 16 * Sizeconfig.horizontalBlock),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txt,
                  style: appStyle(fw: FontWeight.w400, size: 16)
                      .copyWith(color: Colors.white),
                ),
                SizedBox(height: 6 * Sizeconfig.verticalBlock),
                Text(
                  "Today At $date",
                  style: appStyle(fw: FontWeight.w400, size: 14)
                      .copyWith(color: kColor.time),
                ),
              ],
            )
          ],
        ));
  }
}
