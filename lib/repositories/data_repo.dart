
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

var headers = {
  'Content-Type': 'application/json',
  'X-API-Key': dotenv.env['API_KEY']
  };


convertPDF({required String path}) {
  final bytes = File(path).readAsBytesSync();
  String file64 = base64Encode(bytes);
  return file64;
}


encodeJson({
  required String encodedPDF,
  required String roleName,
  required String firstName,
  required String lastName,
  required String email,
  required String phoneNumber,
  required String currentCity,
  required String experience,
  required String bio,
  required String applyForRole,
  required String expectFromRoleAndUs,
  required String whatdoYouExpect,
  required String otherLinks,
}) {
  var data = json.encode({
    "roleName": roleName,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
    "currentCity": currentCity,
    "experience": experience,
    "bio": bio,
    "whyApply": applyForRole, 
    "expectationFromRole": expectFromRoleAndUs, 
    "resume": "data:application/pdf;base64,$encodedPDF",
    "links": [
      "Your LinkedIn Profile Link" 
    ],
    "form": "669f5dffe97ef3e1cf4affa8"
  });
  return data;
}


var dio = Dio();

Future<bool> dioClient({required Object? data}) async {
  try {
    var response = await dio.request(
      dotenv.env['API_URL'].toString(), 
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      debugPrint(json.encode(response.data));
      return true;
    } else {
      debugPrint(response.statusMessage);
      return false;
    }
  } catch (e) {
    debugPrint('Dio Error: $e');
    return false;
  }
}