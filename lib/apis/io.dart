import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart' as p;

Future<String> getLocalFilePath() async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<void> saveLocalFile(String fileName, dynamic data) async {
  final dir = await getLocalFilePath();
  final folder = Directory(p.join(dir, 'Hybrid'));
  if (!(await folder.exists())) {
    await folder.create(recursive: true);
  }
  final file = File(p.join(folder.path, fileName));
  if (!(await file.exists())) {
    await file.create();
  }
  if (data is Map) {
    await file.writeAsString(jsonEncode(data));
  }
}

Future<Map<String, dynamic>> readJsonAsMap(String filename) async {
  try {
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/$filename");

    if (!await file.exists()) {
      throw Exception("File is not found: ${file.path}");
    }

    String contents = await file.readAsString();

    Map<String, dynamic> data = jsonDecode(contents);

    return data;
  } catch (e) {
    throw Exception("Failed to read JSON: $e");
  }
}

Future<void> deleteLocalFile(String fileName) async {
  final path = await getLocalFilePath();
  final file = File('$path/$fileName');
  if (await file.exists()) {
    await file.delete();
  }
}

Future<String> downloadFile(String url, String fileName)async{
  final filePath = p.join(await getLocalFilePath(), 'Hybrid');
  final file = File(p.join(filePath, fileName));
  if (await file.exists()){
    await file.delete();
  }
  await Dio().download(url, file.path);
  return file.path;
}
