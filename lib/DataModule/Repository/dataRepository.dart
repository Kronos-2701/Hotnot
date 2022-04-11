import 'dart:convert';
import 'package:hotnot/DataModule/Model/data_Model.dart';
import 'package:http/http.dart';

String url = "https://jsonplaceholder.typicode.com/photos";

class Data_Repository {
  Future getdata() async {
    Response response = await get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var apiResponse = jsonModel().fetchData(body);
      print(response.body);
      return apiResponse;
    } else {
      throw Exception("Error Connecting to the Server");
    }
  }
}
