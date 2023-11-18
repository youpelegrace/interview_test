import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_interview/constants/colors.dart';
import 'package:test_interview/core/view_model/view_model.dart';
import 'package:test_interview/view/home_page.dart';
import 'package:test_interview/widgets/custom_button.dart';
import 'package:test_interview/widgets/custome_textfield.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameContoller = TextEditingController();

  final passwordContoller = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 100, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login to \nyour account',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 34.0,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Login to continue using your account',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'User Name',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: primaryColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    contoller: usernameContoller,
                    hintText: 'Username',
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: primaryColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    contoller: passwordContoller,
                    hintText: 'Password',
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  CustomButton(
                    isLoading: isLoading,
                    label: 'Login',
                    onPressed: () async {
                      final myModel =
                          Provider.of<ViewModel>(context, listen: false);
                      setState(() {
                        isLoading = true;
                      });
                      await myModel
                          .login(
                        username: usernameContoller.text.trim(),
                        password: passwordContoller.text.trim(),
                      )
                          .then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePages(),
                          ),
                        );
                        setState(() {
                          isLoading = false;
                        });
                      }).catchError((error) {
                        // Handle the error that occurred during account creation
                        print('Error creating account: $error');
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
