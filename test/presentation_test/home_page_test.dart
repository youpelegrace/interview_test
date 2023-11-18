import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:test_interview/core/view_model/view_model.dart';
import 'package:test_interview/view/home_page.dart';

class MockViewModel extends Mock implements ViewModel {}

void main() {
  late MockViewModel mockViewModel;

  setUp(() {
    mockViewModel = MockViewModel();
  });

  tearDown(() {});

  testWidgets('home screen should run', (WidgetTester tester) async {
    when(() => mockViewModel.fetchPaymentMethods()).thenAnswer(
      (_) async => Future.value(true),
    );
    await tester.runAsync(() async {
      await tester.pumpWidget(
        ChangeNotifierProvider<ViewModel>.value(
          value: mockViewModel,
          child: const MaterialApp(home: HomePages()),
        ),
      );

      var findText = find.textContaining("Select a payment method");

      await tester.pumpAndSettle();
      expect(findText, findsOneWidget);
    });
  });
}
