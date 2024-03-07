import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skymood/shared/cubit/states.dart';
import 'package:skymood/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  String key = '2b68054a61184b48a0110450242902';

  //*********current weather*********

  String cityCountry = 'cairo';
  String imageUrl = 'link';
  int nowDegree = 00;
  String weatherDetail = 'weather detail here';
  int cloud = 0;
  double windSpeed = 0.0;
  int humidity = 0;
  double uv = 0.0;
  String lastUpdated = 'last updated';

  //*********forecast weather*********

  List<dynamic> forecastItems = [];

  String forecastFormattedDate = 'formatted date';

  void getCurrentWeather() {
    emit(AppWeatherLoadingState());

    DioHelper.getData(url: 'v1/forecast.json', query: {
      'key': key,
      'q': 'egypt',
      'days': '4',
      'aqi': 'no',
      'alerts': 'no',
    }).then((value) {
      //********current*******

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

      //********forecast*******

      forecastItems = value.data['forecast']['forecastday'];

      forecastFormattedDate =
          DateFormat('M/d').format(DateTime.parse(forecastItems[0]['date']));

      emit(AppWeatherSuccessState());
    }).catchError((error) {
      error.toString();
      emit(AppWeatherErrorState(error.toString()));
    });
  }
}
