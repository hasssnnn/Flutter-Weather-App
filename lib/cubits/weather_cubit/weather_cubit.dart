import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Services/weather_services.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherService weatherService;
  WeatherModel? weatherModel;


  //the two above lines tell us that we'll create the object when we use WeatherCubit//////////
String? cityName;
  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess());
    } catch (error) {
      emit(WeatherFailure());
    }
  }
}
