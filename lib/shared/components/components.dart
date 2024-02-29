import 'package:flutter/material.dart';

Widget forecastItem() => const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'day, date',
          style: TextStyle(
            fontSize: 14.0,
            fontFamily: 'RobotoCondensed',
          ),
        ),
        Icon(
          Icons.cloud,
        ),
        Text(
          'low° - high°',
          style: TextStyle(
            fontSize: 14.0,
            fontFamily: 'RobotoCondensed',
          ),
        ),
      ],
    );

