import 'package:expenses/model/boxes.dart';
import 'package:expenses/model/expenese_model.dart';
import 'package:expenses/screens/home_screen.dart';
import 'package:expenses/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ExpenseModelAdapter());
  await Hive.openBox<ExpenseModel>('expense');
  await Hive.openBox('static');
  await Hive.openBox('name');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var box = Name.getName();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: box.isEmpty ? const RegisterScreen() : const HomePage(),
    );
  }
}
