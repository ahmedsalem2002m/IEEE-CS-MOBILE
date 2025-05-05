import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../cubit/weather_cubit.dart';
import '../cubit/weather_state.dart';
import 'home_page.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final TextEditingController cityController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Enter City",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: formKey,
                child: TextFormField(
                  controller: cityController,
                  validator: (value) {
                    if (value!.isEmpty) return "Must enter city name";
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    hintText: "Enter city name",
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F1D3A),
                    ),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.search),
                    suffixIconColor: Color(0xFF0F1D3A),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              BlocConsumer<WeatherCubit, WeatherState>(
                listener: (context, state) {
                  if (state is WeatherSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HomePage(weatherModel: state.weatherModel),
                      ),
                    );
                  } else if (state is WeatherError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error: ${state.message}")),
                    );
                  }
                },
                builder: (context, state) {
                  bool isLoading = state is WeatherLoading;
                  return ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                      if (formKey.currentState!.validate()) {
                        context
                            .read<WeatherCubit>()
                            .fetchWeather(cityController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: 270,
                      height: 40,
                      child: isLoading
                          ? CircularProgressIndicator(
                        color: HexColor('#56636a'),
                      )
                          : const Text(
                        "Search",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
