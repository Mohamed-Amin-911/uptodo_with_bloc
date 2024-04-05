import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_with_bloc/config/size_config.dart';
import 'package:uptodo_with_bloc/constants/colors.dart';
import 'package:uptodo_with_bloc/constants/text_styke.dart';
import 'package:uptodo_with_bloc/cubit/task_cubit.dart';
import 'package:uptodo_with_bloc/data/task_class.dart';

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({
    super.key,
  });

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, left: 25),
      height: 550 * Sizeconfig.verticalBlock,
      width: double.infinity,
      color: kColor.card,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Add Task",
            style: appStyle(fw: FontWeight.w700, size: 20)
                .copyWith(color: Colors.white),
          ),
          SizedBox(height: 17 * Sizeconfig.verticalBlock),
          SizedBox(
            width: 325 * Sizeconfig.horizontalBlock,
            height: 43 * Sizeconfig.verticalBlock,
            child: TextField(
              controller: _controller,
              style: appStyle(fw: FontWeight.w400, size: 18)
                  .copyWith(color: Colors.white),
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: kColor.time),
                      borderRadius: BorderRadius.circular(4))),
            ),
          ),
          SizedBox(height: 17 * Sizeconfig.verticalBlock),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<TaskCubit>(context, listen: false)
                        .saveIntoSp(Task(
                            txt: _controller.text,
                            date:
                                "${DateTime.now().hour}:${DateTime.now().minute}"));

                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.send_rounded,
                    color: kColor.icon,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
