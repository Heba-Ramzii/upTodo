import 'package:dartz/dartz.dart';

import '../../core/model/task_model.dart';

abstract class TaskRepo
{
  Future<Either<String, void>> addTask(TaskModel taskModel);
  Future<Either<String, void>> deleteTask(String id);
  Future<Either<String, List<TaskModel>>> getTasks() ;
}