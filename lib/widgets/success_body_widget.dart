import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';

import '../models/weather_model.dart';

class SuccessBodyWidget extends StatelessWidget {
  const SuccessBodyWidget({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        weatherData!.getThemeColor(),
        weatherData!.getThemeColor()[300]!,
        weatherData!.getThemeColor()[100]!,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      //  alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Text(
            BlocProvider.of<WeatherCubit>(context).cityName!,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              )),
          Text(

              //'Updated at : ${weatherData!.date}',
              'updated at : ${weatherData!.date!.hour.toString()}:${weatherData!.date!.minute.toString()}',

              //${weatherData!.date!.hour.toString()}:${weatherData!.date.toString()}',
              style: const TextStyle(
                fontSize: 24,
              )),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData!.getImage()),
              Text(
                weatherData!.temp!.toInt().toString(),
                style: const TextStyle(fontSize: 22),
              ),
              Column(
                children: [
                  // Text('${weatherData!.temp}',
                  //     style: const TextStyle(
                  //         fontSize: 30, fontWeight: FontWeight.bold)),
                  // Text('min : ${weatherData!.minTemp.toInt()}',
                  //     style: const TextStyle(
                  //       fontSize: 24,
                  //     )),
                  // Text('max : ${weatherData!.maxTemp.toInt()}',
                  //     style: const TextStyle(
                  //       fontSize: 24,
                  //     )),

                  Text('Max: ${weatherData!.maxTemp!.toInt()}'),
                  Text('Min: ${weatherData!.minTemp!.toInt()}'),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            weatherData!.weatherState!,
            style: const TextStyle(fontSize: 24),
          ),
          // Text(
          //   weatherData?.weatherState ?? '',
          //   style: const TextStyle(
          //       fontSize: 32, fontWeight: FontWeight.bold),
          // ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
