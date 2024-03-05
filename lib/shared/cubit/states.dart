abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppCurrentWeatherLoadingState extends AppStates {}

class AppCurrentWeatherSuccessState extends AppStates {}

class AppCurrentWeatherErrorState extends AppStates {
  final String error;

  AppCurrentWeatherErrorState(this.error);
}
