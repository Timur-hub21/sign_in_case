import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInProvider with ChangeNotifier {
  bool _isValid = false;

  FirebaseAuthException? _errorMessage;

  String? _verificationId;

  bool _isCodeSentSuccess = false;

  bool get isValid => _isValid;

  FirebaseAuthException? get errorMessage => _errorMessage;

  String? get verificationIdGetter => _verificationId;

  bool get isCodeSentSuccess => _isCodeSentSuccess;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: _onVerificationCompleted,
      verificationFailed: _onVerificationFailed,
      codeSent: _onCodeSent,
      codeAutoRetrievalTimeout: _onCodeTimeOut,
      timeout: const Duration(seconds: 30),
    );
  }

  Future<void> _onVerificationCompleted(
      PhoneAuthCredential authCredential) async {
    await firebaseAuth.signInWithCredential(authCredential);
    notifyListeners();
  }

  void _onVerificationFailed(FirebaseAuthException errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  void _onCodeSent(String verificationId, int? forceResendingToken) {
    _verificationId = verificationId;
    _isCodeSentSuccess = true;
    notifyListeners();
  }

  void _onCodeTimeOut(String timeout) {
    return;
  }

  void onPhoneNumberChanged(String textValue) {
    if (textValue.length >= 18) {
      _isValid = true;
    } else {
      _isValid = false;
    }
    notifyListeners();
  }
}
