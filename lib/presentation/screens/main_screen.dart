import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:uptodo_with_bloc/config/size_config.dart';
import 'package:uptodo_with_bloc/constants/colors.dart';
import 'package:uptodo_with_bloc/cubit/task_cubit.dart';
import 'package:uptodo_with_bloc/data/task_class.dart';
import 'package:uptodo_with_bloc/presentation/widgets/calender_widget.dart';
import 'package:uptodo_with_bloc/presentation/widgets/two_buttons_widget.dart';
import 'package:uptodo_with_bloc/constants/text_styke.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Task> allTasks;
  @override
  void initState() {
    super.initState();
    allTasks = BlocProvider.of<TaskCubit>(context).getAllTasks();
  }

  int selected = 0;
  bool heart = false;
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Sizeconfig().init(context);
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: kColor.bg,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 13 * Sizeconfig.verticalBlock),
              Text(
                "Calender",
                style: appStyle(fw: FontWeight.w400, size: 20)
                    .copyWith(color: Colors.white),
              ),
              SizedBox(height: 16 * Sizeconfig.verticalBlock),
              Container(
                color: kColor.card,
                height: 107 * Sizeconfig.verticalBlock,
                width: double.infinity,
                child: const CalenderWidget(),
              ),
              SizedBox(height: 20 * Sizeconfig.verticalBlock),
              const TwoButtonsWidget(),
              SizedBox(height: 16 * Sizeconfig.verticalBlock),
            ],
          ),
        ),
      ),
      bottomNavigationBar: StylishBottomBar(
        items: [
          BottomBarItem(
            icon: const Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            selectedIcon: const Icon(Icons.home_outlined),
            selectedColor: Colors.white,
            unSelectedColor: Colors.white,
            title: const Text('Index'),
          ),
          BottomBarItem(
            icon: const Icon(
              Icons.calendar_month_outlined,
              color: Colors.white,
            ),
            selectedIcon: const Icon(Icons.calendar_month_rounded),
            selectedColor: Colors.white,
            unSelectedColor: Colors.white,
            title: const Text('Calender'),
          ),
          BottomBarItem(
            icon: const Icon(
              Icons.access_time,
              color: Colors.white,
            ),
            selectedIcon: const Icon(Icons.access_time),
            selectedColor: Colors.white,
            unSelectedColor: Colors.white,
            title: const Text('Focus'),
          ),
          BottomBarItem(
            icon: const Icon(
              Icons.person_2_outlined,
              color: Colors.white,
            ),
            selectedIcon: const Icon(Icons.person_2_outlined),
            selectedColor: Colors.white,
            unSelectedColor: Colors.white,
            title: const Text('Profile'),
          ),
        ],
        hasNotch: false,
        notchStyle: NotchStyle.circle,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: 1,
        onTap: (index) {
          if (index == selected) return;
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
        option: AnimatedBarOptions(
          barAnimation: BarAnimation.fade,
          inkEffect: false,
          iconStyle: IconStyle.Default,
        ),
        backgroundColor: kColor.card,
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            heart = !heart;
          });
        },
        backgroundColor: kColor.icon,
        child: const Icon(
          size: 32,
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
