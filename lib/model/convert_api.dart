import 'package:codeproj/model/covid_data.dart';
import 'package:dio/dio.dart';

import 'dart:convert';

class ServiceCovid {
  static Future<CovidData?> connectCovid() async {
    var dio = Dio();
    final res = await dio.get(
        'https://static.easysunday.com/covid-19/getTodayCases.json?fbclid=IwAR2MttxJqqY-eVzi_y-c-7b2pmMzgk6sLrlsTMORrzqWpP1GRXERSO_xHfc');

  }
}
