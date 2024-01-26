import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_case/components/level_tile.dart';
import 'package:sign_in_case/constants/app_colors.dart';
import 'package:sign_in_case/providers/sign_in_confirmation_provider.dart';
import 'package:pinput/pinput.dart';

class SignInConfirmationScreenBody extends StatefulWidget {
  final String phoneNumber;
  final String? verificationCodeId;

  const SignInConfirmationScreenBody({
    super.key,
    required this.verificationCodeId,
    required this.phoneNumber,
  });

  @override
  State<SignInConfirmationScreenBody> createState() =>
      _SignInConfirmationScreenBodyState();
}

class _SignInConfirmationScreenBodyState
    extends State<SignInConfirmationScreenBody> {
  final TextEditingController codeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final timerProvider =
          Provider.of<SignInConfirmationProvider>(context, listen: false);
      if (!timerProvider.isTimerStarted) {
        timerProvider.startTimer();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    codeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signInConfirmationProvider =
        Provider.of<SignInConfirmationProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const LevelTile(
            isFirstLevel: true,
            isSecondLevel: false,
            isThirdLevel: false,
          ),
          const SizedBox(height: 24),
          const Text(
            'Подтверждение',
            style: TextStyle(fontSize: 34),
          ),
          const SizedBox(height: 24),
          Center(
            child: Text(
              "Введите код, который мы отправили\n в SMS на ${widget.phoneNumber}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 62),
          Pinput(
            listenForMultipleSmsOnAndroid: true,
            onCompleted: (String code) => signInConfirmationProvider.verifyCode(
              context,
              verificationId: widget.verificationCodeId,
              otpCode: codeController.text,
            ),
            length: 6,
            controller: codeController,
            defaultPinTheme: PinTheme(
              textStyle: TextStyle(fontSize: 28, color: AppColors.darkGrey),
              width: 39,
              height: 34,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.customButtonColor,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 44),
          !context.watch<SignInConfirmationProvider>().isTimerStarted
              ? InkWell(
                  onTap: () {
                    signInConfirmationProvider.resetTimer();
                    signInConfirmationProvider
                        .resendOtpCode(widget.phoneNumber);
                  },
                  child: Text(
                    'Отправить код еще раз',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.textFormFieldFocusedBorderColor,
                    ),
                  ),
                )
              : Consumer<SignInConfirmationProvider>(
                  builder: (context, providerValue, child) {
                    return Text(
                      '${providerValue.timerCount} сек до повтора отправки кода',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.darkGrey,
                      ),
                    );
                  },
                )
        ],
      ),
    );
  }
}
