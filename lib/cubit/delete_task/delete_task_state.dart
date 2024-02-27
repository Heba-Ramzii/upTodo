

abstract class DeleteTaskState {}

class DeleteTaskInitial extends DeleteTaskState {}
class DeleteTaskLoadingState extends DeleteTaskState {}
class DeleteTaskSuccessState extends DeleteTaskState {}
class DeleteTaskErrorState extends DeleteTaskState {
  String error;
  DeleteTaskErrorState(this.error);
}
