import 'package:flutter/material.dart';
//import 'package:weather_app/view/searche_view.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'there no is weather 😔 start',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
          ),
          Text(
            'Searching Now 🔍',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
