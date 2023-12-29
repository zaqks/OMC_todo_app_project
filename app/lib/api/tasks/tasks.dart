import 'package:http/http.dart' as http;
import 'dart:convert';

import '../links.dart';

String myUrl = links["tasks"]!;
Uri myUri = Uri.parse(myUrl);

Future<Map> getTasks() async {
  Map result = {};

  var response = await http.get(myUri);
  result = jsonDecode(response.body);

  return result;
}

addTask(String content) async {
  await http.post(myUri, body: {"add": content});
}

completeTask(String taskId) async {
  await http.post(myUri, body: {"complete": taskId});
}

deleteTask(String taskId) async {
  await http.post(myUri, body: {"delete": taskId});
}

editTask(String taskId, String content) async {
  await http.post(myUri, body: {"edit": taskId, "content": content});
}
