import 'package:flutter/material.dart';
import 'package:test_interview/constants/colors.dart';

class HomeWallet extends StatelessWidget {
  const HomeWallet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            FloatingActionButton(
                elevation: 5,
                backgroundColor: iconColor,
                onPressed: () {},
                child: const Icon(
                  Icons.folder_outlined,
                  color: white,
                )),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Ejara Flex',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                color: primaryColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: const TextSpan(
                  text: "20,000",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22.0,
                    color: primaryColor,
                  ),
                  children: [
                    TextSpan(
                      text: 'CFA',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 22.0,
                      ),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Divider(
              color: primaryColor.withOpacity(0.10),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10.0, 5, 10, 20),
              child: Row(
                children: [
                  Text(
                    'Earnings per day',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14.0,
                      color: primaryColor,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '10,000CFA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
