import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_case/providers/account_provider.dart';
import 'package:sign_in_case/providers/sign_in_confirmation_provider.dart';
import 'package:sign_in_case/providers/sign_in_provider.dart';
import 'package:sign_in_case/screens/sign_in_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignInProvider>(
          create: (_) => SignInProvider(),
        ),
        ChangeNotifierProvider<SignInConfirmationProvider>(
          create: (_) => SignInConfirmationProvider(),
        ),
        ChangeNotifierProvider<AccountProvider>(
          create: (_) => AccountProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInScreen(),
      ),
    );
  }
}
