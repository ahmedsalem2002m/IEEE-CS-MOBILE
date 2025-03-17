
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final int age;
  final bool isMale;
  final double result;
  BmiResultScreen({
    required this.isMale,
    required this.age,
    required this.result
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            color: Colors.white,
            Icons.arrow_back_ios
          ),
        ),
        backgroundColor: Colors.indigo[900],
        title: Text(
          "BMI RESULT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        color: Colors.indigo[600],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blueGrey[800],
                ),
                alignment: Alignment.center,
                width: 240,
                height: 120,
                padding: EdgeInsets.all(40),
                child: Text(
                  "Gender : ${isMale? "Male" : "Female"}",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    color: Colors.white
                  ),
                ),
              ),
              SizedBox(height: 16,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blueGrey[800],
                ),
                alignment: Alignment.center,
                width: 240,
                height: 120,
                padding: EdgeInsets.all(40),
                child: Text(
                  "Result : ${result.round()}",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: Colors.white
                  ),
                ),
              ),
              SizedBox(height: 16,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blueGrey[800],
                ),
                alignment: Alignment.center,
                width: 240,
                height: 120,
                padding: EdgeInsets.all(40),
                child: Text(
                  "Age : $age",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
