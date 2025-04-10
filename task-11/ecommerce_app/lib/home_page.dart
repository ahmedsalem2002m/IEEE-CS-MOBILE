import 'package:ecommerce_app/details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List categories = [
    {"label": "assets/images/man.png", "name": "Men"},
    {"label": "assets/images/woman.png", "name": "Women"},
    {"label": "assets/images/family.png", "name": "Family"},
    {"label": "assets/images/clothes.png", "name": "Clothes"},
    {"label": "assets/images/food.png", "name": "Foods"},
    {"label": "assets/images/gift.png", "name": "Gifts"},
    {"label": "assets/images/phone.png", "name": "Phones"},
    {"label": "assets/images/car.png", "name": "Cars"},
  ];
  List bestSelling = [
    {
      "icon":
          "assets/images/vecteezy_3d-blank-phone-screen-isolated-on-transparent-background_47242110.png",
      "name": "Phone",
      "description": "Description 1",
      "price": 200,
    },
    {
      "icon":
          "assets/images/vecteezy_realistic-watch-clipart-design-illustration_9379868.png",
      "name": "Watch",
      "description": "Description 2",
      "price": 150,
    },
    {
      "icon":
          "assets/images/vecteezy_a-suit-and-tie-on-a-transparent-background_54634913.png",
      "name": "Suit",
      "description": "Description 3",
      "price": 50,
    },
    {
      "icon":
          "assets/images/vecteezy_car-png-images-with-transparent-background_27441158.png",
      "name": "Car",
      "description": "Description 4",
      "price": 25000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        iconSize: 40,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "."),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: ".",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: ".",
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(12),
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
                itemBuilder: (context, i) {
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
                          child: Image(
                            image: AssetImage("${categories[i]["label"]}"),
                            height: 36,
                            width: 36,
                          ),
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
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ItemDetails(data: bestSelling[i]),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.all(12),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          child: Image(
                            image: AssetImage("${bestSelling[i]["icon"]}"),
                            height: 120,
                          ),
                        ),
                        Text(
                          "${bestSelling[i]["name"]}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          "${bestSelling[i]["description"]}",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "${bestSelling[i]["price"]}\$",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 250,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
