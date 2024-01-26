import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_case/screens/main_screen.dart';

class SignInConfirmationProvider with ChangeNotifier {
  int _timerCount = 60;

  bool _isTimerStarted = false;

  String? _verificationId;

  int get timerCount => _timerCount;

  bool get isTimerStarted => _isTimerStarted;

  String? get verificationId => _verificationId;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void startTimer() {
    _isTimerStarted = true;
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      _timerCount--;
      notifyListeners();

      if (_timerCount <= 0) {
        _isTimerStarted = false;
        timer.cancel();
        notifyListeners();
      }
    });
  }

  void resetTimer() {
    _timerCount = 60;
    notifyListeners();
    startTimer();
  }

  Future<void> resendOtpCode(String phoneNumber) async {
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: _onVerificationCompleted,
      verificationFailed: (FirebaseAuthException errorMessage) {},
      codeSent: (String verificationId, int? forceResendingToken) {},
      codeAutoRetrievalTimeout: (String timeout) {},
      timeout: const Duration(seconds: 60),
    );
    notifyListeners();
  }

  Future<void> _onVerificationCompleted(
      PhoneAuthCredential authCredential) async {
    await firebaseAuth.signInWithCredential(authCredential);
    notifyListeners();
  }

  Future<void> verifyCode(
    BuildContext context, {
    required String? verificationId,
    required String otpCode,
  }) async {
    final PhoneAuthCredential creds = PhoneAuthProvider.credential(
      verificationId: verificationId!,
      smsCode: otpCode,
    );

    final result = await firebaseAuth.signInWithCredential(creds);

    if (!context.mounted) return;

    if (result.user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      );
    }
    notifyListeners();
  }
}
