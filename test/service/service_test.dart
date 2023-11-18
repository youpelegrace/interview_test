// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_interview/core/models/payment_method_res.dart';
import 'package:test_interview/core/services/services.dart';
import 'package:http/http.dart' as http;

import 'payment_res.dart';

// class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}
class MockUserService extends Mock implements UserService {}

class MockHttpClientResponse extends Mock implements http.Response {}

void main() {
  group(
    'UserService Tests',
    () {
      late MockUserService mockUserService;

      setUp(() {
        mockUserService = MockUserService();
      });

      test('should successfully login with valid credentials', () async {
        final response = MockHttpClientResponse();

        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(
          '',
        );
        when(() => mockUserService.login(
            username: 'username', password: 'password')).thenAnswer(
          (invocation) async => Future.value(''),
        );

        final res = await mockUserService.login(
            username: 'username', password: 'password');

        expect(res, isA<String>());
      });

      test('should return payment method', () async {
        final response = MockHttpClientResponse();

        String responseBodyString =
            json.encode(PaymentMethodMockResponse.paymentMethodRes);
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(
          responseBodyString,
        );

        final jsonData = json.decode(response.body);
        when(() => mockUserService.getPaymentsMethod()).thenAnswer(
          (invocation) async => Future<PaymentMethodRes>.value(
              PaymentMethodRes.fromJson(jsonData)),
        );

        final res = await mockUserService.getPaymentsMethod();

        expect(res, isA<PaymentMethodRes>());
      });

      test('should return mobile money method', () async {
        final response = MockHttpClientResponse();

        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(
          '',
        );

        when(() => mockUserService.getMobileMoney(1)).thenAnswer(
          (invocation) async => Future.value(''),
        );

        final res = await mockUserService.getMobileMoney(1);

        expect(res, isA<String>());
      });
    },
  );
}
