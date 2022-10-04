import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api/Api_services.dart';
import 'cubit/cubit/weather_cubit_cubit.dart';
import 'layout/screens/weather_layout.dart';

import '../../api/Api_services.dart';

void main() {
  //WidgetsBinding.instance;
  ApiServices.initDio();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int rdIndex = Random().nextInt(5);
    return BlocProvider(
        create: (context) => WeatherCubitCubit()
          ..getCurrentWeather(country: 'alex')
          ..getRandomCity(rdIndex)
          ..getRandomCity((rdIndex <= 4 && rdIndex >= 1 ? rdIndex + 1 : 2))
          ..getRandomCity((rdIndex <= 4 && rdIndex >= 1 ? rdIndex - 1 : 3))
          ..getLastWeatherData(country: 'alex'),
        child: BlocConsumer<WeatherCubitCubit, WeatherCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: WeatherLayout(),
            );
          },
        ));
  }
}
