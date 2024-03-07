import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skymood/shared/components/constants.dart';
import 'package:weather_icons/weather_icons.dart';

Widget detailRow(BuildContext context, IconData icon, String detail) => Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18.0),
        const SizedBox(width: 8.0),
        Text(
          detail,
          style: const TextStyle(
            fontSize: 16.0,
            fontFamily: 'RobotoCondensed',
          ),
        ),
      ],
    );

Widget forecastItem(BuildContext context, listItem) => SizedBox(
      height: 30.0,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                DateFormat('d/M')
                    .format(DateTime.parse(listItem['date']))
                    .toString(),
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
            ),
            Center(
              child: BoxedIcon(
                weatherIcons[listItem['day']['condition']['text']]!,
                size: 18.0,
              ),
            ),
            Expanded(
              child: Text(
                '${listItem['day']['mintemp_c'].round()}° - ${listItem['day']['maxtemp_c'].round()}°',
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget forecastBuilder(BuildContext context, list) => ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => SizedBox(
        height: 120.0,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) => forecastItem(context, list[index]),
        ),
      ),
      fallback: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
