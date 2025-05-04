import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/screens/home_page.dart';

class SearchPage extends StatelessWidget {
   SearchPage({super.key});
  final TextEditingController cityController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Enter City",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: TextFormField(
                controller: cityController,
                validator: (value){
                  if(value!.isEmpty){
                    return "Must enter city name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: "Enter city name",
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0F1D3A),
                  ),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                  suffixIconColor: const Color(0xFF0F1D3A),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            SizedBox(height: 22,),
            ElevatedButton(
                onPressed: (){
                  if(formKey.currentState!.validate()){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage(cityName: cityController.text,)));
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 270,
                  child: Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color:  Colors.black,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
