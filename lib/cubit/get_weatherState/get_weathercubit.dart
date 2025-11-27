import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weatherState/get_weatherstate.dart';
import 'package:weather_app/modele/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetweatherCubit extends Cubit<GetWeather> {
  GetweatherCubit() : super(GetweatherNotState());
  WeatherModel? weathermodel;
  getWeather({required String cityName}) async {
    try {
      weathermodel = await WeatherService(
        dio: Dio(),
      ).getdata(cityName: cityName);
      emit(Getweatherinfostate(weathermodel!));
    } on Exception catch (e) {
      emit(Getweatherexcetption());
    }
  }
}
