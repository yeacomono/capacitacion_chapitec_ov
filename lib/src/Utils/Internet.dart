
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

abstract class Internet {
  
  static Future httpPost(
      {required String url,
      required Map<String, dynamic> body,
      bool timeOut = false,
      required int seconds}) async {
    try {
      final queryUrl = Uri.parse(url);
      final response = timeOut
          ? await http.post(queryUrl,
              body: body,
              headers: {"Accept": "*/*"}).timeout(Duration(seconds: seconds))
          : await http.post(queryUrl, body: body, headers: {"Accept": "*/*"});
      var decodedData = json.decode(response.body);
      return decodedData;
    } on TimeoutException catch (e) {
      return {
        'valor': 0,
        'message': 'Límite de tiempo de espera excedido.',
        'exception': e
      };
    } catch (e) {
      return {
        'valor': 0,
        'message': 'Ocurrió un error, vuelva a intentarlo.',
        'exception': e
      };
    }
  }

  static Future httpGet({required String url, required String body}) async {
    try {
      final queryUrl = Uri.encodeFull(url) + body + '?overview=false';
      print('queryUrl  $queryUrl');
      final response = await http.get(Uri.parse(queryUrl));
      var decodedData = json.decode(response.body);
      return decodedData;
    } on TimeoutException catch (e) {
      return {
        'valor': 0,
        'message': 'Límite de tiempo de espera excedido.',
        'exception': e
      };
    } catch (e) {
      return {
        'valor': '0',
        'message': 'Ocurrió un error, vuelva a intentarlo.',
        'exception': e
      };
    }
  }

  static Future httpPost2(
      {required String url,
      required Map<String, dynamic> body,
      bool timeOut = false,
      required int seconds}) async {
    try {
      final queryUrl = Uri.parse(url);
      final response = timeOut
          ? await http.post(queryUrl,
              body: body,
              headers: {"Accept": "*/*"}).timeout(Duration(seconds: seconds))
          : await http.post(queryUrl, body: body, headers: {"Accept": "*/*"});
      var decodedData = json.decode(response.body);
      return decodedData;
    } on TimeoutException catch (e) {
      return {
        'status': 'error',
        'message': 'Límite de tiempo de espera excedido.',
        'exception': e
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Ocurrió un error, vuelva a intentarlo.',
        'exception': e
      };
    }
  }

  static Future httpFile({String? url, file})async{
    Dio dio = new Dio();
    final uri = Uri.parse(url??'');
    FormData formData = new FormData.fromMap({
      "files": file
    });


    Response response = await dio.post(url??'', data: formData);
    return response.data['url'];
  }

}
