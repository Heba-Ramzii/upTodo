
abstract class AddTaskState {}

class TaskInitial extends AddTaskState {}

class AddTaskLoadingState extends AddTaskState {}
class AddTaskSuccessState extends AddTaskState {}
class AddTaskErrorState extends AddTaskState
{
  String error;
  AddTaskErrorState(this.error);
}
