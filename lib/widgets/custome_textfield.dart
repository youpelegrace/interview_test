import 'package:flutter/material.dart';
import 'package:test_interview/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hintText, this.contoller, this.suffixIcon});

  final TextEditingController? contoller;
  final String hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contoller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(color: primaryColor, fontSize: 14),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(width: 1, color: primaryColor.withOpacity(0.20)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(width: 1, color: primaryColor.withOpacity(0.20)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(width: 1, color: primaryColor.withOpacity(0.20)),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}
