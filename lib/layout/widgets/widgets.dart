import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../cubit/cubit/weather_cubit_cubit.dart';
import '../../model/current_weather.dart';

Widget buildAppBarImage() {
  return Container(
    height: 250,
    decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/cloud-in-blue-sky.jpg',
            )),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
  );
}

Widget textFormFiledBuilder(
    BuildContext context, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
    child: TextFormField(
      controller: controller,
      onFieldSubmitted: (String value) {
        if (value.isNotEmpty) {
          BlocProvider.of<WeatherCubitCubit>(context)
              .getCurrentWeather(country: value);
          BlocProvider.of<WeatherCubitCubit>(context)
              .getLastWeatherData(country: value);
        }
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide()),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.white)),
    ),
  );
}

Widget cardBuilder(BuildContext context, CurrentWeatherModel model) {
  return Positioned(
    top: 165,
    left: 20,
    right: 20,
    child: Container(
      height: 160,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              textBuilder(model.name),
              textCaptionBuilder(
                  DateFormat.yMMMMEEEEd().format(DateTime.now()).toString(),
                  context),
              Divider(),
              // هاعمله ففانكشن بس مكسل
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        textBuilder(model.weather[0].description),
                        textBuilder(
                            '${(model.main.temp - 272.15).round()} °c '),
                        textCaptionBuilder(
                            'min ${(model.main.temp_min - 272.15).round()} °c / max ${(model.main.temp_max - 272.15).round()} °c ',
                            context),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          lottieBuilder(model.weather[0].description),
                          SizedBox(
                            height: 10,
                          ),
                          textCaptionBuilder(
                              model.wind.speed.toString(), context),
                        ],
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget lottieBuilder(String str) {
  return Lottie.asset(
      str.contains('cloud')
          ? 'assets/113873-clouds.json'
          : str.contains('rain')
              ? 'assets/36622-sunny-rainy.json'
              : 'assets/14444-sunny.json',
      alignment: Alignment.center,
      fit: BoxFit.cover,
      width: 80,
      height: 55);
}

Widget textBuilder(String text) {
  return Text(text,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontWeight: FontWeight.bold,
          color: Colors.grey[500],
          fontSize: 20));
}

Widget textCaptionBuilder(String text, BuildContext context) {
  return Text(
    text,
    style: Theme.of(context).textTheme.caption!.copyWith(
        color: Colors.grey[500], fontSize: 14, overflow: TextOverflow.ellipsis),
  );
}

Widget otherCityContainer(BuildContext context, CurrentWeatherModel model) {
  return Expanded(
    flex: 1,
    child: Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Card(
          child: Column(
        children: [
          textBuilder(model.name),
          textCaptionBuilder(
              '${(model.main.temp - 272.15).round()} °c', context),
          lottieBuilder('${model.weather[0].description}'),
          SizedBox(height: 5),
          textCaptionBuilder('${model.weather[0].description}', context),
          SizedBox(height: 2),
        ],
      )),
    ),
  );
}

dialogBuilder(BuildContext context, TextEditingController controller) {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    title:const Text("City Search "),
    content:const Text("city not found"),
    actions: [
      IconButton(
          onPressed: () {
            // BlocProvider.of<WeatherCubitCubit>(context)
            //     .getCurrentWeather(country: 'alex');
            controller.clear();
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close))
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
