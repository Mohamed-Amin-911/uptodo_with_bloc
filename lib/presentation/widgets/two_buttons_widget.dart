import 'package:flutter/material.dart';
import 'package:uptodo_with_bloc/config/size_config.dart';
import 'package:uptodo_with_bloc/constants/colors.dart';
import 'package:uptodo_with_bloc/constants/text_styke.dart';

class TwoButtonsWidget extends StatelessWidget {
  const TwoButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      height: 80 * Sizeconfig.verticalBlock,
      decoration: BoxDecoration(
          color: kColor.card, borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 137 * Sizeconfig.horizontalBlock,
            height: 49 * Sizeconfig.verticalBlock,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kColor.card,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: const BorderSide(color: kColor.time)),
                ),
                child: Text(
                  "Today",
                  style: appStyle(fw: FontWeight.w400, size: 16)
                      .copyWith(color: Colors.white),
                )),
          ),
          SizedBox(
            width: 137 * Sizeconfig.horizontalBlock,
            height: 49 * Sizeconfig.verticalBlock,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kColor.icon,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: const BorderSide(color: kColor.icon)),
                ),
                child: Text(
                  "Completed",
                  style: appStyle(fw: FontWeight.w400, size: 16)
                      .copyWith(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
