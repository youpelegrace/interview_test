import 'package:flutter/material.dart';
import 'package:test_interview/core/models/payment_method_res.dart';

import 'package:test_interview/core/services/services.dart';

class ViewModel extends ChangeNotifier {
  final UserService _userService = UserService();

  PaymentMethodRes? _paymentMethodRes;
  PaymentMethodRes? get paymentMethodRes => _paymentMethodRes;

  Future<void> login(
      {required String username, required String password}) async {
    await _userService.login(username: username, password: password);
  }

  Future<void> fetchPaymentMethods() async {
    try {
      if (_paymentMethodRes == null) {
        // If not loaded, fetch data
        _paymentMethodRes = await _userService.getPaymentsMethod();
        // Notify listeners to update the UI
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching payment methods: $e');
    }
  }

  Future<void> fetchMobileMoney(int id) async {
    await _userService.getMobileMoney(id);
  }
}
