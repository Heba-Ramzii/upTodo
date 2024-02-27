import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/repo/task_repo/task_repo_imp.dart';
import 'delete_task_state.dart';


class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit(this.taskRepoImp) : super(DeleteTaskInitial());
  static DeleteTaskCubit get(context) => BlocProvider.of(context);

   final TaskRepoImp taskRepoImp;
  Future deleteTask(String id) async {
    emit(DeleteTaskLoadingState());
    var response = await taskRepoImp. deleteTask(id);
    response.fold((error){
      emit(DeleteTaskErrorState(error));

    }, (success) {
      emit(DeleteTaskSuccessState());

    });

  }
}
