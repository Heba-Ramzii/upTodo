import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/constants/theme/style_manager.dart';
import 'package:uptodo/cubit/get_tasks_cubit/get_task_cubit.dart';
import 'package:uptodo/cubit/task_cubit/add_task_cubit.dart';
import 'package:uptodo/cubit/task_cubit/add_task_state.dart';
import 'package:uptodo/view/widget/add_task/icons_button_row.dart';
import '../../../core/constants/theme/theme.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uptodo/controller/task_controller.dart';

import '../../../core/constants/toaster.dart';
import '../../../core/model/task_model.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit,AddTaskState>(
        builder: (context , state){
          return Container(
            padding: const EdgeInsets.only(top:4,left: 25,right: 25,bottom: 25),
            decoration: const BoxDecoration(
              color: ThemeColors.dark,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(state is AddTaskLoadingState)
                const LinearProgressIndicator(),
                const SizedBox(height: 20,),
                const Text(
                  "Add Task",
                  style: StyleManager.textStyleDark20,
                ),
                const SizedBox(height: 14,),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.transparent, // No border when inactive
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius : BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        color: ThemeColors.borderColor,
                      ),
                      gapPadding: 8.0,
                    ),
                    hintStyle: StyleManager.textStyleDark18,
                    fillColor: ThemeColors.dark,
                    filled: false,
                    hintText: "Add task",
                  ),
                ),
                TextFormField(
                  controller: desController,
                  maxLines: null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.transparent, // No border when inactive
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius : BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        color: ThemeColors.borderColor,
                      ),
                      gapPadding: 8.0,
                    ),
                    hintStyle: StyleManager.textStyleDark18,
                    fillColor: ThemeColors.dark,
                    filled: false,
                    hintText: "Description",
                  ),

                ),
                const SizedBox(height: 19,),
                IconsButtonRow(
                  onPressed: () {
                    AddTaskCubit.get(context).taskModel.title = titleController.text;
                    AddTaskCubit.get(context).taskModel.des = desController.text;
                    AddTaskCubit.get(context).addTask();

                  },
                ),
              ],
            ),
          );
        },
    listener:  (context , state ){
      if(state is AddTaskSuccessState){
        GetTasksCubit.get(context).getTasks();
        Toaster.showSuccess(text: "Successful");
        Navigator.pop(context);
      }
      else if(state is AddTaskErrorState){
        Toaster.showError(text:state.error);

      }
    });

  }
}
