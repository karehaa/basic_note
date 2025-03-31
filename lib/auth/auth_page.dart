import 'package:basic_note/bloc/auth_page_cubit.dart';
import 'package:basic_note/content/home_page.dart';
import 'package:basic_note/registration/forgot_password.dart';
import 'package:basic_note/registration/sign_in.dart';
import 'package:basic_note/registration/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthPageCubit, AuthPageState>(
      builder: (context, state) {
        if (state == AuthPageState.authenticated) {
          return HomePage();
        } else if (state == AuthPageState.login ||
            state == AuthPageState.unauthenticated) {
          return SignIn(
            onTap: () => context.read<AuthPageCubit>().toggleLoginRegister(),
            onForgotPassword:
                () => context.read<AuthPageCubit>().toggleForgotPassword(),
          );
        } else if (state == AuthPageState.register) {
          return SignUp(
            onTap: () => context.read<AuthPageCubit>().toggleLoginRegister(),
          );
        } else if (state == AuthPageState.forgotPassword) {
          return ForgotPassword(
            onBack: () => context.read<AuthPageCubit>().backToLogin(),
          );
        } else {
          return Container(); // Fallback
        }
      },
    );
  }
}
