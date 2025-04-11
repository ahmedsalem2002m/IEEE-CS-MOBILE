import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  final data;

  const ItemDetails({super.key, this.data});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
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
      endDrawer: Drawer(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: 50,
              width: 40,
              image: AssetImage("assets/images/shopping.png"),
            ),
            Text("  Ecommerce ", style: TextStyle(fontWeight: FontWeight.w600)),
            Text(
              "online",
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        elevation: 0.0,
        backgroundColor: Colors.grey[200],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 36),
            color: Colors.grey[200],
            child: Image(height: 200, image: AssetImage(widget.data['icon'])),
          ),
          Container(
            padding: EdgeInsets.only(top:24),
            alignment: Alignment.center,
            child: Text(
              "${widget.data["name"]}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "${widget.data["description"]}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.grey),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:16),
            alignment: Alignment.center,
            child: Text(
              "${widget.data["price"]}\$",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.orange),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 42,),
                Text(
                  "Color: ",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600,color: Colors.grey[600]),
                ),
                Row(
                  children: [Icon(Icons.circle,size: 32,color: Colors.grey,),
                    Text(
                      "Grey",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.black),
                    ),],
                ),
                Row(children: [
                  Icon(Icons.circle,size: 32,color: Colors.black,),
                  Text(
                    "Black",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.black),
                  ),
                ],
                ),
                SizedBox(width: 42,),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:16),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Size: ",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600,color: Colors.grey[600]),

                ),
                Text(
                  "        39   40   41   42   43",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.black),

                ),
              ],
            ),
          ),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 44),
            color: Colors.black,
            margin: EdgeInsets.symmetric(vertical: 32,horizontal: 44),
            child: MaterialButton(
              padding: EdgeInsets.all(16),
                onPressed:(){},
              child: Text(
                "Add To Cart",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900,color: Colors.white),

              ),
            ),
          ),

        ],
      ),
    );
  }
}
