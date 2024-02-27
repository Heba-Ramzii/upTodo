import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uptodo/core/constants/theme/style_manager.dart';
import 'package:uptodo/core/constants/theme/theme.dart';
import 'package:uptodo/core/constants/widgets/profile_image.dart';
import 'package:uptodo/core/model/task_model.dart';
import 'package:uptodo/cubit/get_tasks_cubit/get_task_cubit.dart';
import 'package:uptodo/cubit/get_tasks_cubit/get_task_state.dart';
import 'package:uptodo/cubit/task_cubit/add_task_cubit.dart';
import 'package:uptodo/generated/assets.dart';
import 'package:uptodo/view/pages/add_screen/add_screen.dart';
import 'package:uptodo/view/pages/home/home_task.dart';
import 'package:uptodo/view/widget/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:uptodo/view/widget/bottom_nav_bar/floating_action_buttom.dart';

import '../../../controller/task_controller.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
         leading: IconButton(onPressed:  (){},
          icon: const Icon(
            Icons.filter_list,
            color: ThemeColors.fontColorDark,
            size: 32,
        ),),
        title: const Text(
            "Home",
        style: StyleManager.textStyleDark20,
        ),
        actions: const [
          ProfileImage(size: 42,),
          SizedBox(width: 10,)
        ],
      ),
      body: BlocConsumer<GetTasksCubit, GetTaskState>(
        builder: (context, state)
        {
          if (state is GetTasksLoadingState)
          {
            return const Center(child: CircularProgressIndicator(),);
          }
          else if(state is GetTasksSuccessState)
          {
            return HomeTask();
          }
          else if(state is GetTasksSuccessEmptyState)
          {
            return Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.imagesHome,
                  height: 230,
                  width: 230,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "What do you want to do today?",
                    textAlign: TextAlign.center,
                    style: StyleManager.textStyleDark20,
                  ),
                ),
                const Text(
                  "Tap + to add your tasks",
                  textAlign: TextAlign.center,
                  style: StyleManager.textStyleDark16,
                ),
              ],
            ));
          }
          else if (state is GetTasksErrorState)
          {
            return Center(child: Text(state.error, style: TextStyle(color: Colors.white),),);
          }
          else
          {
            return const SizedBox();
          }

        }, listener: (context, state){}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:  CustomFloatingButton(
        onPressed: (){
          AddTaskCubit.get(context).taskModel = TaskModel();
           return _showBottomSheet(context);
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 5,
        context: context,
        builder: (context) => const AddScreen());
  }

}
