import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weatherState/get_weathercubit.dart';
import 'package:weather_app/cubit/get_weatherState/get_weatherstate.dart';
import 'package:weather_app/view/searche_view.dart';
import 'package:weather_app/widjet/no_weather_body.dart';
import 'package:weather_app/widjet/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 7,
        backgroundColor: Colors.transparent,
        title: Text(
          'WeatherApp',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchView()),
              );
            },
            icon: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),

      body: BlocBuilder<GetweatherCubit, GetWeather>(
        builder: (context, state) {
          if (state is GetweatherNotState) {
            return NoWeatherBody();
          } else if (state is Getweatherinfostate) {
            return WeatherInfoBody(weather: state.weathermodel);
          } else {
            return Text('error');
          }
        },
      ),
    );
  }
}
