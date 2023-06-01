import 'package:expenses/model/boxes.dart';
import 'package:expenses/screens/home_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String name = "";
  int credit = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(),
          Container(
            child: Icon(Icons.currency_rupee_sharp,
                size: 100, color: Colors.green),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    focusColor: Colors.green,
                    fillColor: Colors.green,
                    hoverColor: Colors.green,
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Container(height: MediaQuery.of(context).size.height * 0.05),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      credit = int.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    focusColor: Colors.green,
                    fillColor: Colors.green,
                    hoverColor: Colors.green,
                    labelText: 'inittial credit',
                    hintText: 'Enter inital credit',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(),
          GestureDetector(
            onTap: () {
              var nameBox = Name.getName();
              var statBox = Stat.getStatic();
              nameBox.put('name', name);
              statBox.put('static', credit);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(),
                  Text("continue",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ],
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 23, 121, 57),
                      Color.fromARGB(255, 8, 19, 8),
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
          )
        ],
      ),
    );
  }
}
