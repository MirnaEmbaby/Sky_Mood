import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skymood/shared/components/constants.dart';
import 'package:skymood/shared/cubit/states.dart';
import 'package:skymood/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  String key = '2b68054a61184b48a0110450242902';

  //*********current weather*********

  String cityCountry = 'cairo';
  String localTime = 'local time';
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
      'q': cityCountry,
      'days': '4',
      'aqi': 'no',
      'alerts': 'no',
    }).then((value) {
      //********current*******

      var current = value.data['current'];

      cityCountry =
          '${value.data['location']['name']}, ${value.data['location']['country']}';
      localTime = value.data['location']['localtime'];
      nowDegree = current['temp_c'].round() ?? 00;
      weatherDetail = current['condition']['text'] ?? 'detail';
      cloud = current['cloud'] ?? 00;
      windSpeed = current['wind_kph'] ?? 00;
      humidity = current['humidity'] ?? 00;
      uv = current['uv'] ?? 00;
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

  List<String> search(String value) {
    if (value.isEmpty) {
      return [];
    }
    return cities
        .where((city) => city.toLowerCase().contains(value.toLowerCase()))
        .take(5)
        .toList();
  }

  List<String> filteredCities = [];

  void searchOnChanged(value) {
    filteredCities = search(value);
    emit(AppSearchChangedState());
  }

  void searchOnSubmit(value) {
    searchOnChanged(value);
    cityCountry = filteredCities[0];
    getCurrentWeather();
    changeShowSearchBody();
    filteredCities = [];
    emit(AppSearchSubmittedState());
  }

  void searchOnTap(value){
    cityCountry = value;
    getCurrentWeather();
    changeShowSearchBody();
    filteredCities = [];
    emit(AppSearchSubmittedState());
  }

  bool showSearchBody = false;

  void changeShowSearchBody() {
    showSearchBody = !showSearchBody;
    emit(AppChangeShowSearchBodyState());
  }
}
