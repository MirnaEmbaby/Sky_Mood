import 'package:flutter/material.dart';
import 'package:skymood/shared/components/components.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'city, country',
                style: TextStyle(
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
              const SizedBox(height: 50.0),
              const Icon(
                Icons.cloudy_snowing,
                size: 80.0,
              ),
              const Text(
                '0°',
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
              const SizedBox(height: 15.0),
              const Text(
                'weather detail',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
              const SizedBox(height: 30.0),
              const Text(
                'wind detail',
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wind_power),
                  Text(
                    'num m/s',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'RobotoCondensed',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
              forecastItem(),
              forecastItem(),
              forecastItem(),
              forecastItem(),
              forecastItem(),
            ],
          ),
        ),
      ),
    );
  }
}
