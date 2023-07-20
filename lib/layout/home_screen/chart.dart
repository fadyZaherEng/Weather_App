
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/layout/home_screen/weather_controller.dart';
import 'package:weather_app/models/weather_within_5days/need_class_to_draw_garph_last5days_between_date_temp.dart';

class MyChart extends GetView<WeatherController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 240,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries<FiveDayData, String>>[
            SplineSeries<FiveDayData, String>(
              dataSource: controller.fiveDaysData,
              xValueMapper: (FiveDayData f, _) =>
              f.dateTime,
              yValueMapper: (FiveDayData f, _) =>
              f.temp,
            ),
          ],
        ),
      ),
    );
  }
}
