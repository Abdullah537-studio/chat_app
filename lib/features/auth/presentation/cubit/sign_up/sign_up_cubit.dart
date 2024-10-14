import 'package:bloc/bloc.dart';
import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/requiest/signup_request_entity.dart';
import 'package:chat_2/features/auth/domin/usecases/signup_usecase.dart';
import 'package:equatable/equatable.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SigninUseCase signinUseCase;

  SignUpCubit(this.signinUseCase) : super(SignUpState.intitial());

  Future<void> signin({required SigninRequest signinEntity}) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final signinData = await signinUseCase(signinEntite: signinEntity);
    signinData.fold((failure) {
      try {
        emit(state.copyWith(
            message: failure.response?.body, status: CubitStatus.faild));
      } catch (e) {
        emit(state.copyWith(message: e.toString(), status: CubitStatus.faild));
      }
    }, (data) {
      // AppSharedPreferences.cacheSignUserInfocanLogin(canLogin: data.canLogin);

      emit(state.copyWith(status: CubitStatus.done));
    });
  }
}
