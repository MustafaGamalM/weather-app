import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/layout/widgets/widgets.dart';

import '../../cubit/cubit/weather_cubit_cubit.dart';
import '../widgets/Linear_chart_widget.dart';

class WeatherLayout extends StatelessWidget {
  TextEditingController textFormField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubitCubit, WeatherCubitState>(
      listener: (context, state) {
        if (state is GetWeatherCurrentErrorState) {
          dialogBuilder(context, textFormField);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<WeatherCubitCubit>(context);
        return (cubit.randomCureentDataList.length > 2 &&
                cubit.currentWeatherModel != null &&
                cubit.fiveDayData != null)
            ? Scaffold(
                backgroundColor: Colors.white,
                body: CustomScrollView(
                  //physics: BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverAppBar(
                        backgroundColor: Colors.white,
                        expandedHeight: 315,
                        flexibleSpace: FlexibleSpaceBar(
                            background: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            buildAppBarImage(),
                            textFormFiledBuilder(context, textFormField),
                            cardBuilder(context, cubit.currentWeatherModel),
                          ],
                        ))),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Container(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                textBuilder('Other cities'),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    otherCityContainer(context,
                                        cubit.randomCureentDataList[0]),
                                    otherCityContainer(context,
                                        cubit.randomCureentDataList[1]),
                                    otherCityContainer(
                                        context, cubit.randomCureentDataList[2])
                                  ],
                                ),
                                textBuilder('Forecast next 5 days'),
                                SizedBox(
                                  height: 0,
                                ),
                                linearChartBuilder(cubit.fiveDayData!.list),
                              ],
                            ),
                          );
                        },
                        childCount: 1,
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
