
import 'package:expenses/expenese_model.dart';
import 'package:expenses/single_item.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'boxes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    var box = Stat.getStatic();
    if (box.isEmpty) {
      box.put("static", 0);
    }
  }

  _showDialog() {
    String expenseTitle = "";
    int expenseAmount = 0;
    bool isExpense = true;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Color.fromARGB(255, 188, 219, 188),
              title: Text("Add Expense"),
              content: StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(hintText: "Expense Title"),
                        onChanged: (value) {
                          setState(() {
                            expenseTitle = value;
                          });
                        },
                      ),
                      // radio for debit and credit
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value: true,
                                  groupValue: isExpense,
                                  onChanged: (value) {
                                    setState(() {
                                      isExpense = value as bool;
                                    });
                                  }),
                              Text("Debit")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value: false,
                                  groupValue: isExpense,
                                  onChanged: (value) {
                                    setState(() {
                                      isExpense = value as bool;
                                    });
                                  }),
                              Text("Credit")
                            ],
                          ),
                        ],
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: "Expense Amount"),
                        onChanged: (value) {
                          setState(() {
                            expenseAmount = int.parse(value);
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
              actions: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 41, 48, 43))),
                    onPressed: () {
                      final expense = ExpenseModel(
                        id: DateTime.now().toString(),
                        expenseTitle: expenseTitle,
                        expenseAmount: expenseAmount,
                        isExpense: isExpense,
                      );
                      final box = Boxes.getExpenses();
                      box.add(expense);
                      expense.save();
                      final static = Stat.getStatic();
                      isExpense
                          ? static.put(
                              "static", static.get("static") - expenseAmount)
                          : static.put(
                              "static", static.get("static") + expenseAmount);
                      Navigator.pop(context);
                    },
                    child: Text("Add"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(

                      // add a neomorphic effect to the container
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 29, 44, 29),
                          Color.fromARGB(255, 33, 204, 84),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                          spreadRadius: 1.0,
                          offset: Offset(4.0, 4.0),
                        ),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.080,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.menu,
                                color: Colors.white,
                              )),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width:
                                    MediaQuery.of(context).size.height * 0.04,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 188, 219, 188)),
                              ),
                              Container(
                                width: 10,
                              )
                            ],
                          ),
                        ],
                      ),
                      Text("welcome joshua",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2,
                    ),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                        // make container opaque

                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 188, 219, 188),
                            Color.fromARGB(255, 14, 83, 34),
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
                  ),
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.25,
                left: MediaQuery.of(context).size.width * 0.35,
                child: ValueListenableBuilder(
                  valueListenable: Stat.getStatic().listenable(),
                  builder: (context, box, _) {
                    final static = box.get("static");
                    return Column(
                      children: [
                        Text("remaining credit"),
                        Text(
                          "$static",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 55,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.5,
            child: ValueListenableBuilder<Box<ExpenseModel>>(
                valueListenable: Boxes.getExpenses().listenable(),
                builder: (context, box, _) {
                  final expenses = box.values.toList().cast<ExpenseModel>();
                  return expenses.length == 0
                      ? Center(child: Text("No expenses yet"))
                      : ListView.builder(
                          itemCount: expenses.length,
                          itemBuilder: (context, index) {
                            final expense = expenses[index];
                            return SingleItem(
                              expenseModel: expense,
                            );
                          },
                        );
                }),
          ),
          FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 41, 48, 43),
            onPressed: _showDialog,
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
