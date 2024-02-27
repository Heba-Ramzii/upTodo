import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:uptodo/core/model/task_model.dart';
import 'package:uptodo/repo/home_repo.dart';
import 'package:uptodo/repo/task_repo/task_repo.dart';

class TaskRepoImp extends TaskRepo {
  @override
  Future<Either<String, void>> addTask(TaskModel taskModel) async {
    try
    {
      await FirebaseFirestore.instance.collection('users')
          .doc(HomeRepo.userModel.id)
          .collection('tasks')
          .add(taskModel.toJson());
      return right(0);
    }catch(e)
    {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<TaskModel>>> getTasks() async{
    try
    {
      var response = await FirebaseFirestore.instance.collection('users')
          .doc(HomeRepo.userModel.id)
          .collection('tasks').get();
      List<TaskModel> tasks =[];
      for (var element in response.docs) {
        tasks.add(TaskModel.fromJson(element.data()));
      }
      return right(tasks);

    }catch(e)
    {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> deleteTask(String id) async {
    try
    {
      await FirebaseFirestore.instance.collection('users')
          .doc(HomeRepo.userModel.id)
          .collection('tasks')
          .doc(id).delete();
      return right(0);
    }catch(e)
    {
      return left(e.toString());
    }
  }

  
}