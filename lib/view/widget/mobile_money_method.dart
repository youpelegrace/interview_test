import 'package:flutter/material.dart';
import 'package:test_interview/constants/colors.dart';
import 'package:test_interview/view/widget/new_mobile_money.dart';
import 'package:test_interview/widgets/bottom_sheet.dart';
import 'package:test_interview/widgets/custom_button.dart';

class MobileMoneyMethod extends StatelessWidget {
  const MobileMoneyMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 20, top: 15),
          child: Row(
            children: [
              const Text(
                'Select the mobile money method',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: primaryColor,
                ),
              ),
              const Spacer(),
              InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 20,
                  ))
            ],
          ),
        ),
        Divider(
          color: primaryColor.withOpacity(0.10),
        ),
        const SizedBox(
          height: 30,
        ),
        const Icon(
          Icons.edgesensor_low_outlined,
          size: 100,
          color: primaryColor,
        ),
        const Text(
          'No mobile money method',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: primaryColor,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const Row(
          children: [
            Expanded(
              child: Divider(
                indent: 20,
                endIndent: 10,
              ),
            ),
            Text(
              'Or',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                color: primaryColor,
              ),
            ),
            Expanded(
              child: Divider(
                indent: 10,
                endIndent: 20,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            CustomBottomSheet.showFullscreen(
              context,
              const NewMobileMoney(),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: iconColor.withOpacity(0.20),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: iconColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Another mobile money method',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14.0,
                      color: iconColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomButton(label: 'Continue', onPressed: () {}),
        )
      ],
    );
  }
}
