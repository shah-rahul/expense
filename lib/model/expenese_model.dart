import 'package:hive/hive.dart';
part 'expenese_model.g.dart';

@HiveType(typeId: 0)
class ExpenseModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String expenseTitle;
  @HiveField(2)
  int expenseAmount;
  @HiveField(3)
  bool isExpense;

  ExpenseModel(
      {required this.id,
      required this.expenseTitle,
      required this.expenseAmount,
      required this.isExpense});
}
