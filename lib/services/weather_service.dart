import 'package:dio/dio.dart';
import 'package:weather_app/modele/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apikey = '2cf524093b05455e904104019250811';
  Future<WeatherModel> getdata({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apikey&q=$cityName&days=1',
      );

      WeatherModel weathermodel = WeatherModel.fromJson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String error =
          e.response?.data['error']['message'] ?? 'error ,try later';
      throw Exception(error);
    } catch (e) {
      throw Exception('error try later');
    }
  }
}
