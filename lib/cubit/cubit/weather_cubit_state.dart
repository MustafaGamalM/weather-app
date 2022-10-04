part of 'weather_cubit_cubit.dart';

@immutable
abstract class WeatherCubitState {}

class WeatherCubitInitial extends WeatherCubitState {}

class GetWeatherCurrentSuccessedState extends WeatherCubitState {}

class GetWeatherLoading extends WeatherCubitState {}

class GetWeatherCurrentErrorState extends WeatherCubitState {}

class GetLastWeatherDataSuccessedState extends WeatherCubitState {}

class GetLastWeatherDataErrorState extends WeatherCubitState {}
// Get Random Cities

class GetRandomDataSuccessedState extends WeatherCubitState {}

class GetRandomDataErrorState extends WeatherCubitState {}

class GetRandomDataLoadingState extends WeatherCubitState {}
