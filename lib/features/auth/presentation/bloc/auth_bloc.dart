import 'package:blog_app/features/auth/domain/usercases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _signUp;
  AuthBloc({required UserSignUp signUp})
      : _signUp = signUp,
        super(AuthInitial()) {
    on<AuthSignUp>((AuthSignUp event, Emitter<AuthState> emit) async {
      final response = await _signUp(UserSignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ));

      response.fold((e) => emit(AuthFailure(e.message)), (uid) => emit(AuthSuccess(uid)));
    });
  }
}
