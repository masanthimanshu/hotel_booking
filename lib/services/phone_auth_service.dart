import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PhoneAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> sendOtp(String phoneNumber) async {
    final Completer<String> completer = Completer<String>();

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        codeSent: (String verificationId, int? resendToken) async {
          Fluttertoast.showToast(msg: "OTP Sent");
          completer.complete(verificationId);
        },
        verificationFailed: (e) => throw Exception(e.message),
        codeAutoRetrievalTimeout: (String verificationId) {
          Fluttertoast.showToast(msg: "OTP Timed Out");
        },
      );

      return completer.future;
    } on FirebaseAuthException {
      Fluttertoast.showToast(msg: "Error Sending OTP");
      return null;
    }
  }

  Future<UserCredential?> verifyOtp({
    required String verificationId,
    required String userOTP,
    required String name,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );

      final UserCredential userCredential = await _auth
          .signInWithCredential(credential)
          .catchError((e) => throw Exception(e.message));

      await _auth.currentUser?.updateDisplayName(name);

      return userCredential;
    } on FirebaseAuthException {
      Fluttertoast.showToast(msg: "Error Verifying OTP");
      return null;
    }
  }
}
