 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/cubit/task_cubit/add_task_state.dart';
import 'package:uptodo/repo/task_repo/task_repo_imp.dart';

import '../../core/model/task_model.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this.taskRepoImp) : super(TaskInitial());
  static AddTaskCubit get(context) => BlocProvider.of(context);

  late TaskModel taskModel;
  final TaskRepoImp taskRepoImp ;


  Future addTask() async
  {
    emit(AddTaskLoadingState());
    var response = await taskRepoImp.addTask(taskModel);
    response.fold((error){
      emit(AddTaskErrorState(error));

    }, (success) {
      emit(AddTaskSuccessState());

    });

  }
}