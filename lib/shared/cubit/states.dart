abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppWeatherLoadingState extends AppStates {}

class AppWeatherSuccessState extends AppStates {}

class AppWeatherErrorState extends AppStates {
  final String error;

  AppWeatherErrorState(this.error);
}

class AppSearchSubmittedState extends AppStates{}

class AppSearchChangedState extends AppStates{}

class AppChangeShowSearchBodyState extends AppStates{}
