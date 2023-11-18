import 'package:flutter/material.dart';
import 'package:test_interview/core/models/payment_method_res.dart';

import 'package:test_interview/core/services/services.dart';

class ViewModel extends ChangeNotifier {
  final UserService _userService = UserService();

  PaymentMethodRes? _paymentMethodRes;
  PaymentMethodRes? get paymentMethodRes => _paymentMethodRes;

  Future<bool?> login(
      {required String username, required String password}) async {
    await _userService.login(username: username, password: password);
    return null;
  }

  Future<bool?> fetchPaymentMethods() async {
    try {
      if (_paymentMethodRes == null) {
        _paymentMethodRes = await _userService.getPaymentsMethod();

        notifyListeners();
      }
    } catch (e) {
      print('Error fetching payment methods: $e');
    }
    return null;
  }

  Future<bool?> fetchMobileMoney(int id) async {
    await _userService.getMobileMoney(id);
    return null;
  }
}
