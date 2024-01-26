import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_case/components/custom_button.dart';
import 'package:sign_in_case/components/custom_text_form_field.dart';
import 'package:sign_in_case/components/level_tile.dart';
import 'package:sign_in_case/constants/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_case/providers/sign_in_provider.dart';
import 'package:sign_in_case/screens/sign_in_confirmation_screen.dart';

class SignInScreenBody extends StatefulWidget {
  const SignInScreenBody({super.key});

  @override
  State<SignInScreenBody> createState() => _SignInScreenBodyState();
}

class _SignInScreenBodyState extends State<SignInScreenBody> {
  final TextEditingController phoneNumberController = TextEditingController();

  final MaskTextInputFormatter _phoneNumberFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
  );

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    phoneNumberController.value = const TextEditingValue(text: '+7');
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SignInProvider signInProvider =
        Provider.of<SignInProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const LevelTile(
            isFirstLevel: false,
            isSecondLevel: false,
            isThirdLevel: false,
          ),
          const SizedBox(height: 24),
          const Text(
            'Регистрация',
            style: TextStyle(fontSize: 34),
          ),
          const SizedBox(height: 24),
          const Text(
            'Введите номер телефона\nдля регистрации',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 38),
          CustomTextFormField(
            onChanged: (String value) =>
                signInProvider.onPhoneNumberChanged(value),
            title: 'Номер телефона',
            controller: phoneNumberController,
            inputFormatters: [_phoneNumberFormatter],
          ),
          const SizedBox(height: 120),
          CustomButton(
            isActive: context.watch<SignInProvider>().isValid,
            onTap: () {
              signInProvider.signInWithPhoneNumber(phoneNumberController.text);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (conext) => SignInConfirmationScreen(
                    verificationCodeId:
                        context.read<SignInProvider>().verificationIdGetter,
                    phoneNumber: phoneNumberController.text,
                  ),
                ),
              );
            },
            title: 'Отправить смс-код',
          ),
          const SizedBox(height: 8),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text:
                  'Нажимая на данную кнопку, вы даете\n согласие на обработку ',
              style: TextStyle(
                color: AppColors.customButtonColor,
                fontSize: 10,
              ),
              children: <TextSpan>[
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => debugPrint('Open personal data link'),
                  text: 'персональных данных',
                  style: TextStyle(
                    color: AppColors.textFormFieldFocusedBorderColor,
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
