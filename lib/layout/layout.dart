import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                    bottom: 30.0, left: 30.0, right: 30.0),
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
                    const SizedBox(height: 40.0),
                    Icon(
                      cubit.weatherIcon,
                      size: 80.0,
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
                        const SizedBox(height: 40.0),
                      ],
                    ),
                    const Divider(height: 10.0, thickness: 0.5),
                    const SizedBox(height: 15.0),
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
