import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: 32,
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                "Power Consistency",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.blueGrey[400],
                ),
              ),
              SizedBox(height: 30),
              Text(
                textAlign: TextAlign.center,
                "Consistency is the key to success in any aspect of life. Whether it’s learning a new skill, building a business, or improving personal habits, small, repeated efforts lead to significant results over time. Many people start with enthusiasm but give up when they don’t see immediate progress.",
                style: TextStyle(
                  fontSize: 20,
                  //fontWeight: FontWeight.w500,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.blueGrey[300]),
                      Icon(Icons.star, color: Colors.blueGrey[300]),
                      Icon(Icons.star, color: Colors.blueGrey[300]),
                      Icon(Icons.star, color: Colors.blueGrey[300]),
                      Icon(Icons.star, color: Colors.blueGrey[300]),
                    ],
                  ),
                  Text(
                    "170 Reviews",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.account_balance_wallet_rounded,
                        size: 24,
                        color: Colors.green[200],
                      ),
                      SizedBox(height: 8),
                      Text(
                        "PREP:",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 8),
                      Text(
                          "25 min",
                        style: TextStyle(
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.access_alarm_sharp,
                        size: 24,
                        color: Colors.green[200],
                      ),
                      SizedBox(height: 8),
                      Text(
                        "COOK:",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 8),
                      Text(
                          "1 hr",
                        style: TextStyle(
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.food_bank_rounded,
                        size: 24,
                        color: Colors.green[200],
                      ),
                      SizedBox(height: 8),
                      Text(
                        "FEEDS:",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 8),
                      Text(
                          "4-6",
                        style: TextStyle(
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
