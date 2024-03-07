import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skymood/shared/components/components.dart';
import 'package:skymood/shared/components/constants.dart';
import 'package:skymood/shared/cubit/cubit.dart';
import 'package:skymood/shared/cubit/states.dart';
import 'package:weather_icons/weather_icons.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getCurrentWeather(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          var list = AppCubit.get(context).forecastItems;

          return SafeArea(
            child: Scaffold(
              backgroundColor: const Color(0xFFE6E6E6),
              appBar: AppBar(
                backgroundColor: const Color(0xFFE6E6E6),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              body: ConditionalBuilder(
                condition: state is! AppWeatherLoadingState,
                builder: (context) => Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    bottom: 12.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cubit.cityCountry,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'RobotoCondensed',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Now',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'RobotoCondensed',
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      BoxedIcon(
                        weatherIcons[cubit.weatherDetail]!,
                        size: 60.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Container()),
                          Center(
                            child: Text(
                              cubit.nowDegree.toString(),
                              style: const TextStyle(
                                fontSize: 44.0,
                                fontFamily: 'RobotoCondensed',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              '°',
                              style: TextStyle(
                                fontSize: 44.0,
                                fontFamily: 'RobotoCondensed',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      Text(
                        cubit.weatherDetail,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'RobotoCondensed',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          detailRow(context, Icons.wb_cloudy_outlined,
                              '${cubit.cloud}'),
                          detailRow(
                              context, Icons.air, '${cubit.windSpeed} km/h'),
                          detailRow(context, Icons.water_drop_outlined,
                              '${cubit.humidity}'),
                          detailRow(
                              context, Icons.wb_sunny_outlined, '${cubit.uv}'),
                          const SizedBox(height: 15.0),
                        ],
                      ),
                      const Divider(height: 10.0, thickness: 0.5),
                      forecastBuilder(context, list),
                      const SizedBox(height: 10.0),
                      Text(
                        'Last Updated on: ${cubit.lastUpdated}',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'RobotoCondensed',
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
