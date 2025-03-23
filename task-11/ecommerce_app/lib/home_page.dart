import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List categories=[
    {
      "icon" : Icons.man,
      "name" : "Men"
    },
    {
      "icon" : Icons.woman,
      "name" : "Woman"
    },
    {
      "icon" : Icons.electrical_services,
      "name" : "Electric"
    },
    {
      "icon" : Icons.car_crash_rounded,
      "name" : "Car"
    },
    {
      "icon" : Icons.earbuds,
      "name" : "Earbuds"
    },


  ];
  List bestSelling=[
    {
      "icon" : "assets/images/download.jpeg",
      "name" : "Phone 1",
      "description" : "Description 1",
      "price" : 320
    },
    {
      "icon" : "assets/images/download.jpeg",
      "name" : "Phone 2",
      "description" : "Description 2",
      "price" : 120
    },
    {
      "icon" : "assets/images/download.jpeg",
      "name" : "Phone 3",
      "description" : "Description 3",
      "price" : 220
    },
    {
      "icon" : "assets/images/download.jpeg",
      "name" : "Phone 4",
      "description" : "Description 4",
      "price" : 100
    },



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, size: 30),
                      hintText: "search",
                      border: InputBorder.none,
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.menu, size: 40),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 70,
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 80,
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context,i){
                  return Container(
                    margin: EdgeInsets.only(right: 12),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Icon(categories[i]["icon"], size: 40),
                        ),
                        Text(
                          "${categories[i]["name"]}",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 70,
              child: Text(
                "Best Selling",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              itemCount: bestSelling.length,
              itemBuilder: (context,i){
                return Card(
                  margin: EdgeInsets.all(12),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        child: Image(
                          image: AssetImage(
                            "${bestSelling[i]["icon"]}",
                          ),
                          height: 120,
                        ),
                      ),
                      Text(
                        "${bestSelling[i]["name"]}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 24

                        ),
                      ),
                      Text(
                        "${bestSelling[i]["description"]}",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 20
                        ),
                      ),
                      Text(
                        "${bestSelling[i]["price"]}\$",
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w900,
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),
                );
              },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 250
              ),
            ),
          ],
        ),
      ),
    );
  }
}
