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
            alignment: Alignment.center,
            child: Text(
              "${widget.data["price"]}\$",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }
}
