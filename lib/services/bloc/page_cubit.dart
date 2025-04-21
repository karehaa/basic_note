import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum PageState {
  login,
  register,
  forgotPassword,
  authenticated,
  unauthenticated,
}

class PageCubit extends Cubit<PageState> {
  FirebaseAuth auth = FirebaseAuth.instance;

  PageCubit() : super(PageState.unauthenticated) {
    checkAuth();
  }

  void checkAuth() {
    final user = auth.currentUser;
    if (user != null) {
      emit(PageState.authenticated);
    } else {
      emit(PageState.unauthenticated);
    }
  }

  void toggleLoginRegister() {
    emit(state == PageState.login ? PageState.register : PageState.login);
  }

  void toggleForgotPassword() {
    emit(PageState.forgotPassword);
  }

  void backToLogin() {
    emit(PageState.login);
  }
}
