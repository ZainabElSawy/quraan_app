import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quraan_app/features/home/data/data_sources/Azkar_datasource/azkar_datasource.dart';

class AzkarDataSourceImp extends AzkarDataSource {
  AzkarDataSourceImp();
  @override
  Future<List<dynamic>> fetchAzkarData() async {
    try {
      final String response =
          await rootBundle.loadString('assets/database/azkar.json');
      var data = await json.decode(response);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<dynamic>> fetchAzkarDetailsData() async {
    try {
      final String response =
          await rootBundle.loadString('assets/database/azkar_details.json');
      var data = await json.decode(response);
      // ignore: avoid_print
      print("Azkar_Details: $data");
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
