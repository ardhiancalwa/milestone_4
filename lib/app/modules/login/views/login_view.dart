import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milestone_4/app/routes/app_pages.dart';
import 'package:milestone_4/app/theme/color.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 80,
          ),
          child: Column(
            children: [
              Text(
                'Sign in',
                style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'It was popularised in the 1960s with the release of Letraset sheetscontaining Lorem Ipsum.',
                style: GoogleFonts.poppins(
                  color: whiteDark,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50,
                    width: 170,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: greyDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          )),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.asset('assets/images/items/facebook.png'),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            'Facebook',
                            style: GoogleFonts.poppins(
                              color: white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 170,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: greyDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          )),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.asset('assets/images/items/google.png'),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            'Google',
                            style: GoogleFonts.poppins(
                              color: white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Or",
                      style: GoogleFonts.poppins(
                        color: grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              TextField_Widget(
                controller: emailC,
                keyboardType: TextInputType.emailAddress,
                hintText: 'test@gmail.com',
                isObsecure: false,
                suffixIcon: Icon(
                  Icons.email,
                  color: white,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextField_Widget(
                controller: passwordC,
                keyboardType: TextInputType.text,
                hintText: '123456',
                isObsecure: true,
                suffixIcon: Icon(
                  Icons.visibility_off,
                  color: white,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forget Password?',
                  style: GoogleFonts.poppins(
                    color: primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shadowColor: primaryColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14))),
                  onPressed: () {
                    Get.toNamed(Routes.NAVIGATION);
                  },
                  child: Text(
                    'Log In',
                    style: GoogleFonts.poppins(
                      color: white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    'Don\'t have account? ',
                    style: TextStyle(
                      color: white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.REGISTER);
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class TextField_Widget extends StatelessWidget {
  const TextField_Widget({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.isObsecure,
    required this.suffixIcon,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final bool isObsecure;
  final Icon suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autocorrect: false,
      keyboardType: keyboardType,
      cursorColor: primaryColor,
      obscureText: isObsecure,
      style: TextStyle(
        color: white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: greyDark,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: grey),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
