import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthPageState {
  login,
  register,
  forgotPassword,
  authenticated,
  unauthenticated,
}

class AuthPageCubit extends Cubit<AuthPageState> {
  FirebaseAuth auth = FirebaseAuth.instance;

  AuthPageCubit() : super(AuthPageState.unauthenticated) {
    checkAuth();
  }

  void checkAuth() {
    final user = auth.currentUser;
    if (user != null) {
      emit(AuthPageState.authenticated);
    } else {
      emit(AuthPageState.unauthenticated);
    }
  }

  void toggleLoginRegister() {
    emit(
      state == AuthPageState.login
          ? AuthPageState.register
          : AuthPageState.login,
    );
  }

  void toggleForgotPassword() {
    emit(AuthPageState.forgotPassword);
  }

  void backToLogin() {
    emit(AuthPageState.login);
  }
}
