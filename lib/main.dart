import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController num1Controller = TextEditingController();
  String result = "";

  void calculate() {
    final num1 = double.tryParse(num1Controller.text) ?? 0; 

    if (num1 < 1) {
      setState(() {
        result = "Введите корректный этаж (>= 1)"; 
      });
    } else if (num1 == 1) {
      setState(() {
        result = "0 сом (1 этаж бесплатно)"; 
      });
    } else {
      final cost = (num1 - 1) * 20; 
      setState(() {
        result = "$cost сомов"; 
      });
    }
  }


  void _clear() {
    setState(() {
      num1Controller.clear();
      result = ""; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Введите этаж',
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: calculate, 
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text('ок'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: ElevatedButton(
                    onPressed: _clear, 
                    child: Text('отмена'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Результаты: $result",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
