import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skymood/shared/cubit/cubit.dart';

Widget forecastItem(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            AppCubit.get(context).forecastDayDate,
            style: const TextStyle(
              fontSize: 14.0,
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
