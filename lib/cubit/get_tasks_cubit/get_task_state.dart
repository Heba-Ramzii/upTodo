
import '../../core/model/task_model.dart';

abstract class GetTaskState {}

class GetTasksInitial extends GetTaskState {}

class GetTasksLoadingState extends GetTaskState {}
class GetTasksSuccessEmptyState extends GetTaskState {}
class GetTasksSuccessState extends GetTaskState
{
  List <TaskModel> tasks =[];
  GetTasksSuccessState(this.tasks);
}
class GetTasksErrorState extends GetTaskState
{
  String error;
  GetTasksErrorState(this.error);
}
