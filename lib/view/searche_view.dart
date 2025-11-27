//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weatherState/get_weathercubit.dart';
//import 'package:weather_app/cubit/get_weatherState/get_weatherstate.dart';
//import 'package:weather_app/modele/weather_model.dart';
//import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text('Search City')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                onSubmitted: (value) {
                  var blc = BlocProvider.of<GetweatherCubit>(context);
                  blc.getWeather(cityName: value);
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 10,
                  ),
                  suffixIcon: Icon(Icons.search),
                  labelText: 'Search',
                  hintText: 'Entrer your city',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
