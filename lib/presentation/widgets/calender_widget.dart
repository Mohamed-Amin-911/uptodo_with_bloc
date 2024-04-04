import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:uptodo_with_bloc/config/size_config.dart';
import 'package:uptodo_with_bloc/constants/colors.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      headerProps: const EasyHeaderProps(
          centerHeader: true,
          monthPickerType: MonthPickerType.switcher,
          dateFormatter: DateFormatter.monthOnly(),
          showSelectedDate: false,
          monthStyle: TextStyle(
              fontFamily: "Lato",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white)),
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
      activeColor: kColor.icon,
      timeLineProps: const EasyTimeLineProps(),
      dayProps: EasyDayProps(
          dayStructure: DayStructure.dayStrDayNum,
          height: 48 * Sizeconfig.verticalBlock,
          width: 39 * Sizeconfig.horizontalBlock,
          activeDayStyle: const DayStyle(
            dayStrStyle: TextStyle(
                fontFamily: "Lato",
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700),
            dayNumStyle: TextStyle(
                fontFamily: "Lato",
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700),
            borderRadius: 4,
          ),
          inactiveDayStyle: const DayStyle(
              dayStrStyle: TextStyle(
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
              dayNumStyle: TextStyle(
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
              borderRadius: 4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Color(0xff272727))),
          todayHighlightStyle: TodayHighlightStyle.withBackground,
          todayHighlightColor: kColor.icon,
          todayStyle: const DayStyle(
            borderRadius: 4,
            dayStrStyle: TextStyle(
                fontFamily: "Lato",
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700),
            dayNumStyle: TextStyle(
                fontFamily: "Lato",
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700),
          )),
    );
  }
}
