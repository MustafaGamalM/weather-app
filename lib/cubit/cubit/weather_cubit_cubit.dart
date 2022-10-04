import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../api/Api_services.dart';
import '../../model/current_weather.dart';
import '../../model/forecaset_five_days.dart';

part 'weather_cubit_state.dart';

class WeatherCubitCubit extends Cubit<WeatherCubitState> {
  WeatherCubitCubit() : super(WeatherCubitInitial());
  static WeatherCubitCubit get(context) => BlocProvider.of(context);
  late CurrentWeatherModel currentWeatherModel;

  getCurrentWeather({required String country}) {
    emit(GetWeatherLoading());
    ApiServices.getData(
      url: 'weather?q=$country&appid=1159a94fbd3e555a759b90145cd6fada',
    ).then((value) {
      currentWeatherModel = CurrentWeatherModel.fromJson(value.data);

      emit(GetWeatherCurrentSuccessedState());
    }).catchError((e) {
      print(e.toString());
      emit(GetWeatherCurrentErrorState());
    });
  }

  List<String> cities = [
    'cairo',
    'minya',
    'Luxor',
    'zagazig',
    'ismailia',
    'aswan',
  ];

   List<CurrentWeatherModel> randomCureentDataList = [];
  getRandomCity(int cityNum) {
    emit(GetRandomDataLoadingState());
    if (randomCureentDataList.length > 3) {
      randomCureentDataList = [];
    }

    ApiServices.getData(
      url:
          'weather?q=${cities[cityNum]}&appid=1159a94fbd3e555a759b90145cd6fada',
    ).then((value) {
      CurrentWeatherModel model = CurrentWeatherModel.fromJson(value.data);
      randomCureentDataList.add(model);
      emit(GetRandomDataSuccessedState());
    }).catchError((e) {
      print(e.toString());
      emit(GetRandomDataErrorState());
    });
  }

   FavDayLast? fiveDayData;
  getLastWeatherData({required String country}) {
    ApiServices.getData(
      url: 'forecast?q=$country&appid=1159a94fbd3e555a759b90145cd6fada',
    ).then((value) {
      fiveDayData = FavDayLast.fromJson(value.data);
      emit(GetLastWeatherDataSuccessedState());
    }).catchError((e) {
      print(e.toString());
      emit(GetLastWeatherDataErrorState());
    });
  }
}
