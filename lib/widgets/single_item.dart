import 'package:expenses/model/expenese_model.dart';
import 'package:flutter/material.dart';



class SingleItem extends StatelessWidget {
  final ExpenseModel expenseModel;
  const SingleItem({
    super.key,
    required this.expenseModel,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(expenseModel.id),
      onDismissed: (direction) {
        expenseModel.delete();
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                !expenseModel.isExpense
                    ? Color.fromARGB(255, 188, 219, 188)
                    : Color.fromARGB(255, 202, 56, 40),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
                spreadRadius: 1.0,
                offset: Offset(4.0, 4.0),
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // circular icon container
            Container(
              margin: const EdgeInsets.only(left: 10),
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.height * 0.08,
              child: Icon(
                !expenseModel.isExpense ? Icons.add : Icons.remove,
                size: 30,
                color: Colors.black,
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: !expenseModel.isExpense
                      ? Color.fromARGB(255, 188, 219, 188)
                      : Color.fromARGB(255, 221, 57, 39)),
            ),
            Container(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  expenseModel.expenseTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 10,
                ),
                Text(
                  expenseModel.expenseAmount.toString() + " Rs",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
