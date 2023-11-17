import 'package:flutter/material.dart';
import 'package:test_interview/constants/colors.dart';
import 'package:test_interview/widgets/custom_button.dart';
import 'package:test_interview/widgets/custome_textfield.dart';

class NewMobileMoney extends StatefulWidget {
  const NewMobileMoney({super.key});

  @override
  State<NewMobileMoney> createState() => _NewMobileMoneyState();
}

class _NewMobileMoneyState extends State<NewMobileMoney> {
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            CircleAvatar(
              backgroundColor: primaryColor.withOpacity(
                0.100,
              ),
              radius: 20,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close,
                    color: primaryColor,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'New mobile money',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.0,
                  color: primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Choose the mobile operator',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  color: primaryColor),
            ),
            const SizedBox(
              height: 5,
            ),
            const CustomTextField(
              hintText: 'Orange money',
              suffixIcon: Icon(
                Icons.keyboard_arrow_down,
                color: primaryColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Phone number',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  color: primaryColor),
            ),
            const SizedBox(
              height: 5,
            ),
            const CustomTextField(
              hintText: '6 94 94 89',
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Full name',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  color: primaryColor),
            ),
            const SizedBox(
              height: 5,
            ),
            const CustomTextField(
              hintText: 'King',
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 0.7,
                  child: Switch(
                    activeColor: primaryColor,
                    value: switchValue,
                    onChanged: (bool value) {
                      setState(() {
                        switchValue = value;
                      });
                    },
                  ),
                ),
                const Text(
                  'Save as payment method',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      color: primaryColor),
                ),
              ],
            ),
            const Spacer(),
            CustomButton(
              label: 'Continue',
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
