import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:test_interview/constants/constants.dart';
import 'package:test_interview/core/models/payment_method_res.dart';
import 'package:test_interview/core/services/security.dart';

class UserService {
  final http.Client? httpClient;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  UserService({this.httpClient});

  Future<String?> login(
      {required String username, required String password}) async {
    final Map<String, dynamic> data = {
      "log": username,
      "password": password,
    };
    try {
      final response = await http.post(
          Uri.parse(
            '$baseUrl1/auth/login',
          ),
          headers: {
            'api-key': apiKey,
            'client-id': clientId,
            'app-version': appVersion,
            'app-platform': appPlatform,
            'client': client,
            'Accept-language': 'en'
          },
          body: data);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String authToken = responseData['token'];

        await SecureStorage().writeSecureData('token', authToken);

        log('Response data: ${response.body}');
      } else {
        // Handle errors
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  Future<PaymentMethodRes?> getPaymentsMethod() async {
    try {
      final authToken = await SecureStorage().readSecureData('token');

      final response = await http.get(
        Uri.parse(
          '$baseUrl2/marketplace/payment-types-per-country?countryCode=CM&transactionType=buy',
        ),
        headers: {
          'authorization': "Bearer $authToken",
          'api-key': apiKey,
          'client-id': clientId,
          'app-version': appVersion,
          'app-platform': appPlatform,
          'client': client,
          'Accept-language': 'en'
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final momoRes = PaymentMethodRes.fromJson(jsonData);
        log('Response data: ${response.body}');
        return momoRes;
      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<dynamic> getMobileMoney(int id) async {
    try {
      final authToken = await SecureStorage().readSecureData('token');

      final response = await http.get(
        Uri.parse(
          '$baseUrl1/customer/payment-settings-per-type?paymentTypeId=$id&countryCode=CM&transactionType=buy',
        ),
        headers: {
          'authorization': "Bearer $authToken",
          'api-key': apiKey,
          'client-id': clientId,
          'app-version': appVersion,
          'app-platform': appPlatform,
          'client': client,
          'Accept-language': 'en'
        },
      );

      if (response.statusCode == 200) {
        return null;
      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
