import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weatherState/get_weathercubit.dart';
import 'package:weather_app/modele/weather_model.dart';
//import 'package:weather_app/view/searche_view.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weathermodel = BlocProvider.of<GetweatherCubit>(
      context,
    ).weathermodel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getColore(
              BlocProvider.of<GetweatherCubit>(
                context,
              ).weathermodel!.weathercondition,
            ),
            getColore(
              BlocProvider.of<GetweatherCubit>(
                context,
              ).weathermodel!.weathercondition,
            )[300]!,
            getColore(
              BlocProvider.of<GetweatherCubit>(
                context,
              ).weathermodel!.weathercondition,
            )[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weathermodel.cityName,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              'Upadate at ${weathermodel.date.hour.toString().padLeft(2, '0')}:${weathermodel.date.minute.toString().padLeft(2, '0')}',
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network('https:${weathermodel.image!}'),
                Text(
                  weathermodel.temp.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text('Maxtemp:${weathermodel.maxtemp.round()}'),
                    Text('Mintemp:${weathermodel.mintemp.round()}'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              weathermodel.weathercondition,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
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
