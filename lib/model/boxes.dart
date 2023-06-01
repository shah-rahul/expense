import 'package:expenses/model/expenese_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<ExpenseModel> getExpenses() => Hive.box<ExpenseModel>('expense');
}

class Stat {
  static Box getStatic() => Hive.box('static');
}

class Name  {
  static Box getName() => Hive.box('name');
}