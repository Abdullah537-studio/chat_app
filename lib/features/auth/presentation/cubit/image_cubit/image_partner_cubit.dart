import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/features/auth/domin/usecases/image_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'image_partner_state.dart';

class ImagePartnerCubit extends Cubit<ImagePartnerState> {
  final ImagePartnerUseCase imagePartnerUseCase;
  ImagePartnerCubit(this.imagePartnerUseCase)
      : super(ImagePartnerState.initial());

  getImagePartner() async {
    emit(state.copyWith(status: CubitStatus.loading));
    final imagePartnerData = await imagePartnerUseCase();
    imagePartnerData.fold(
      (failure) {
        try {
          emit(state.copyWith(
              status: CubitStatus.faild, message: failure.error));
        } catch (e) {
          emit(
              state.copyWith(status: CubitStatus.faild, message: e.toString()));
        }
      },
      (data) {
        emit(
            state.copyWith(status: CubitStatus.done, image: data.imagePartner));
      },
    );
  }
}
