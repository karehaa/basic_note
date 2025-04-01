import 'package:basic_note/bloc/page_cubit.dart';
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
    return BlocBuilder<PageCubit, PageState>(
      builder: (context, state) {
        if (state == PageState.authenticated) {
          return HomePage();
        } else if (state == PageState.login ||
            state == PageState.unauthenticated) {
          return SignIn(
            onTap: () => context.read<PageCubit>().toggleLoginRegister(),
            onForgotPassword:
                () => context.read<PageCubit>().toggleForgotPassword(),
          );
        } else if (state == PageState.register) {
          return SignUp(
            onTap: () => context.read<PageCubit>().toggleLoginRegister(),
          );
        } else if (state == PageState.forgotPassword) {
          return ForgotPassword(
            onBack: () => context.read<PageCubit>().backToLogin(),
          );
        } else {
          return Container(); // Fallback
        }
      },
    );
  }
}
