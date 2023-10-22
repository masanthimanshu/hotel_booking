import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotel_booking/services/phone_auth_service.dart';
import 'package:hotel_booking/view/auth/otp_bottom_sheet.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final RegExp _numberPattern = RegExp(r'^\d{10}$');

  String _countryCode = "+91";
  String _phone = "";
  String _name = "";

  void _handlePhoneNumber() {
    if (_name.trim() == "") {
      Fluttertoast.showToast(msg: "Enter Your Name");
      return;
    }

    if (_numberPattern.hasMatch(_phone)) {
      PhoneAuthService().sendOtp("$_countryCode $_phone").then((value) {
        OtpScreen(context: context).otpBottomSheet(
          countryCode: _countryCode,
          verId: value!,
          phone: _phone,
          name: _name,
        );
      });
    } else if (_phone.trim() == "") {
      Fluttertoast.showToast(msg: "Enter Phone Number");
    } else {
      Fluttertoast.showToast(msg: "Invalid Phone Number");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image.asset(
              "assets/images/login_bg.png",
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 15,
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  const Text(
                    "Welcome User,",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text("Enter your phone number to Sign In"),
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 3,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: TextField(
                      onChanged: (text) => _name = text,
                      decoration: const InputDecoration(
                        hintText: "Name",
                        icon: Icon(Icons.person),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 3,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CountryCodePicker(
                          onChanged: (code) {
                            _countryCode = code.dialCode!;
                          },
                          favorite: const ["IN"],
                          initialSelection: "IN",
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (text) => _phone = text,
                            decoration: const InputDecoration(
                              hintText: "Phone",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handlePhoneNumber,
                      child: const Text("Next"),
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
