import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weatherState/get_weathercubit.dart';
import 'package:weather_app/cubit/get_weatherState/get_weatherstate.dart';
import 'package:weather_app/modele/home_view.dart';
//import 'package:weather_app/widjet/no_weather_body.dart';
//import 'package:weather_app/widjet/weather_info_body.dart';
//import 'package:weather_app/cubit/get_weatherState/get_weatherstate.dart';
//import 'package:weather_app/view/searche_view.dart';
//import 'package:weather_app/widjet/no_weather_body.dart';
//import 'package:weather_app/widjet/weather_info_body.dart';
//import 'package:weather_app/widjet/weather_info_body.dart';
//import 'package:weather_app/cubit/get_weatherState/get_weathercubit.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetweatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetweatherCubit, GetWeather>(
          builder: (context, state) {
            // String? condition;
            //if (state is Getweatherinfostate) {
            //condition = state.weathermodel.weathercondition;
            //print(condition);
            // }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: getColore(
                    BlocProvider.of<GetweatherCubit>(
                      context,
                    ).weathermodel?.weathercondition,
                  ),
                ),
                appBarTheme: AppBarTheme(
                  backgroundColor: getColore(
                    BlocProvider.of<GetweatherCubit>(
                      context,
                    ).weathermodel?.weathercondition,
                  ),
                ),
              ),
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }

  MaterialColor getColore(String? condition) {
    if (condition == null) {
      return Colors.red;
    }
    switch (condition) {
      case 'Sunny':
        return Colors.amber;
      case 'Partly Cloudy ':
        return Colors.grey;
      case 'Patchy rain nearby':
        return Colors.grey; // Bright yellow for sunny
      // Soft grey for partly cloudy
      case 'Cloudy':
        return Colors.blue; // Blue for cloudy
      case 'Overcast':
        return Colors.blueGrey; // Darker grey for overcast
      case 'Mist':
      case 'Patchy light snow':
        return Colors.cyan; // Light blue for mist
      case 'Patchy rain possible':
      case 'Light rain':
      case 'Moderate rain':
      case 'Snow':
        return Colors.lightBlue; // Light blue for light/moderate rain
      case 'Heavy rain':
      case 'Torrential rain shower':
        return Colors.indigo; // Dark blue for heavy rain
      // White for snow conditions
      // Dark grey for fog
      case 'Thundery outbreaks possible':
        return Colors.orange; // Orange for thunder
      // Add more conditions as needed
      default:
        return Colors.red; // Default case if condition doesn't match
    }
  }
}
