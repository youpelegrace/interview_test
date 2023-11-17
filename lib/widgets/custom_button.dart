import 'package:flutter/material.dart';
import 'package:test_interview/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
  });
  final String label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: primaryColor,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: white,
              fontSize: 14,
            ),
          )),
    );
  }
}
