import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/model/task_model.dart';
import 'package:uptodo/core/model/user_model.dart';
import 'package:uptodo/repo/task_repo/task_repo_imp.dart';
import 'get_task_state.dart';

class GetTasksCubit extends Cubit<GetTaskState> {
  GetTasksCubit(this.taskRepoImp) : super(GetTasksInitial());
  static GetTasksCubit get(context) => BlocProvider.of(context);

  final TaskRepoImp taskRepoImp;


  Future getTasks() async
  {
    emit(GetTasksLoadingState());
    var response = await taskRepoImp.getTasks();
    response.fold(
            (l)  {
              emit(GetTasksErrorState(l));

            }
        , (tasks)  {
          if(tasks.isEmpty)
          {
            emit(GetTasksSuccessEmptyState());
          }
          else {
            emit(GetTasksSuccessState(tasks));
          }

    }
    );
}
}