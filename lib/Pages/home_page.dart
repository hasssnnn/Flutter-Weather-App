// ignore_for_file: must_be_immutable
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:weather_app/Pages/search_page.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/models/weather_model.dart';

import '../widgets/defaultt_home_page.dart';
import '../widgets/success_body_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SearchPage();
                  }),
                );
              },
              icon: const Icon(Icons.search)),
        ],
        title: const Text(
          'Weather App',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is WeatherSuccess) {
          weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
          return SuccessBodyWidget(weatherData: weatherData);
        } else if (state is WeatherFailure) {
          return Center(
            child: Text(
              r"There's an error, please try again'",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
          );
        } else {
          return DefaultHomePageWidget();
        }
      }),
    );
  }
}
