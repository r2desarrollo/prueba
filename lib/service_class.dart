import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'data_class.dart';
import 'data_model.dart';

Future<DataModel?> getSinglePostData() async {
  DataModel? result;
  try {
    final response = await http.get(
      Uri.parse("http://192.168.100.121:5001/api/pesaje"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = DataModel.fromJson(item);
    } else {
      print("error");
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
}