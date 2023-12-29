import "../api/tasks/tasks.dart";

import '../MyApp.dart';

bool loaded = false;
Map userTasks = {};

initFuncs() async {
  loaded = false;
  refreshMyApp!();
  userTasks = await getTasks();
  loaded = true;
  refreshMyApp!();
}
