import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skymood/shared/components/components.dart';
import 'package:skymood/shared/cubit/cubit.dart';
import 'package:skymood/shared/cubit/states.dart';

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
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.only(
                  bottom: 30.0,
                  left: 30.0,
                  right: 30.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cubit.cityCountry,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'RobotoCondensed',
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
                      height: 40.0,
                    ),
                    Icon(
                      cubit.weatherIcon,
                      size: 80.0,
                    ),
                    Text(
                      '${cubit.nowDegree.toString()}°',
                      style: const TextStyle(
                        fontSize: 44.0,
                        fontFamily: 'RobotoCondensed',
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      cubit.weatherDetail,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'RobotoCondensed',
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'Wind',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'RobotoCondensed',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.air),
                        const SizedBox(
                          width: 2.0,
                        ),
                        Text(
                          '${cubit.windSpeed}',
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'RobotoCondensed',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    forecastItem(context),
                    forecastItem(context),
                    forecastItem(context),
                    forecastItem(context),
                    forecastItem(context),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
