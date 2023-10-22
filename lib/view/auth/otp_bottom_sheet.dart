import 'package:flutter/material.dart';
import 'package:hotel_booking/services/phone_auth_service.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen {
  OtpScreen({required this.context});

  final BuildContext context;

  void otpBottomSheet({
    required String countryCode,
    required String verId,
    required String phone,
    required String name,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: 250,
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const Text(
                  "Phone Number Verification",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Enter OTP sent to $countryCode - $phone",
                ),
                const SizedBox(height: 50),
                PinCodeTextField(
                  length: 6,
                  autoFocus: true,
                  appContext: context,
                  onCompleted: (e) {
                    PhoneAuthService().verifyOtp(
                      userOTP: e,
                      name: name,
                      verificationId: verId,
                    );

                    Navigator.pop(context);
                  },
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    activeColor: Colors.grey,
                    selectedColor: Colors.black,
                    inactiveColor: Colors.black,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
