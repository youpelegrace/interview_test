import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_interview/constants/colors.dart';
import 'package:test_interview/core/view_model/view_model.dart';
import 'package:test_interview/view/widget/home_wallet.dart';
import 'package:test_interview/view/widget/mobile_money_method.dart';
import 'package:test_interview/widgets/bottom_sheet.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<ViewModel>(context);
    return FutureBuilder<void>(
      future: notifier.fetchPaymentMethods(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      const Text(
                        'Choose a payment \nmethod',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const HomeWallet(),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Select a payment method',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18.0,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              final paymentMethod =
                                  notifier.paymentMethodRes!.data![index];
                              return GestureDetector(
                                onTap: () {
                                  CustomBottomSheet.show(
                                    context,
                                    const MobileMoneyMethod(),
                                  );
                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          iconColor.withOpacity(0.20),
                                      radius: 25,
                                      child: const Icon(
                                        Icons.credit_card,
                                        color: iconColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          paymentMethod.titleEn ?? '',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.0,
                                            color: primaryColor,
                                          ),
                                        ),
                                        Text(
                                          "Fees: ${paymentMethod.descriptionEn ?? ''}",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12.0,
                                            color: primaryColor,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (_, __) {
                              return Divider(
                                height: 30,
                                color: primaryColor.withOpacity(0.10),
                              );
                            },
                            itemCount:
                                notifier.paymentMethodRes?.data?.length ?? 0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
