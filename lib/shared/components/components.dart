import 'package:flutter/material.dart';
import 'package:skymood/shared/cubit/cubit.dart';

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

Widget forecastItem(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            AppCubit.get(context).forecastDayDate,
            style: const TextStyle(
              fontSize: 16.0,
              fontFamily: 'RobotoCondensed',
            ),
          ),
        ),
        Center(
          child: Icon(
            AppCubit.get(context).forecastIcon,
            size: 18.0,
          ),
        ),
        Expanded(
          child: Text(
            '${AppCubit.get(context).forecastLowDegree}° - ${AppCubit.get(context).forecastHighDegree}°',
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: 14.0,
              fontFamily: 'RobotoCondensed',
            ),
          ),
        ),
      ],
    );

Widget forecastBuilder(BuildContext context, int index) => ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        title: forecastItem(context),
      ),
    );
