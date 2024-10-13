import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/core/shared/shared_pref.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/requiest/login_request_entity.dart';
import 'package:chat_2/features/auth/domin/usecases/login_usecase.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;
  LoginCubit(this.loginUsecase) : super(LoginState.initial());
//login
  Future<void> login({required LoginRequest loginEntity}) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final loginData = await loginUsecase(loginEntite: loginEntity);
    loginData.fold((failure) {
      try {
        emit(state.copyWith(status: CubitStatus.faild, message: failure.error));
      } catch (e) {
        emit(state.copyWith(status: CubitStatus.faild, message: e.toString()));
      }
    }, (data) {
      AppSharedPreferences.cacheAuthUserInfoTest(
        accessToken: data.result.accessToken,
        userId: data.result.userId,
      );
      emit(state.copyWith(status: CubitStatus.done));
    });
  }
}
