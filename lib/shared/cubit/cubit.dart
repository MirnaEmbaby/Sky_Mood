import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skymood/shared/cubit/states.dart';
import 'package:skymood/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  String key = '2b68054a61184b48a0110450242902';

  String cityCountry = 'cairo';
  String imageUrl = 'link';
  int nowDegree = 00;
  String weatherDetail = 'weather detail here';
  int cloud = 0;
  double windSpeed = 0.0;
  int humidity = 0;
  double uv = 0.0;
  String lastUpdated = 'last updated';

  String forecastDayDate = 'fore day, date';
  IconData forecastIcon = Icons.error_outline;
  int forecastLowDegree = 0;
  int forecastHighDegree = 0;

  void getCurrentWeather() {
    emit(AppCurrentWeatherLoadingState());

    DioHelper.getData(url: 'v1/current.json', query: {
      'key': key,
      'q': 'egypt',
      'aqi': 'no',
    }).then((value) {

      var current = value.data['current'];

      cityCountry =
          '${value.data['location']['name']}, ${value.data['location']['country']}';
      imageUrl = current['condition']['icon'];
      nowDegree = current['temp_c'].round();
      weatherDetail = current['condition']['text'];
      cloud = current['cloud'];
      windSpeed = current['wind_kph'];
      humidity = current['humidity'];
      uv = current['uv'];
      lastUpdated = current['last_updated'];

      emit(AppCurrentWeatherSuccessState());
    }).catchError((error) {
      error.toString();
      emit(AppCurrentWeatherErrorState(error.toString()));
    });
  }
}
