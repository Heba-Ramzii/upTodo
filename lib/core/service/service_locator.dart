
import 'package:get_it/get_it.dart';
import 'package:uptodo/repo/task_repo/task_repo_imp.dart';

final getIt = GetIt.instance;

void setupForgotPassSingleton() {
  getIt.registerSingleton<TaskRepoImp>(TaskRepoImp());

}
