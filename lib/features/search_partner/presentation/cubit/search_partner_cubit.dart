import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/features/chat_partner/presentation/classes/user_and_partner_info.dart';
import 'package:chat_2/features/search_partner/data/models/requiest/search_partner_requiest_model.dart';
import 'package:chat_2/features/search_partner/data/models/response/search_partner_response_model.dart';
import 'package:chat_2/features/search_partner/domain/usecases/get_all_partner_useCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_partner_state.dart';

class SearchPartnerCubit extends Cubit<SearchPartnerState> {
  final GetAllPartnerUseCase partnerUseCase;
  SearchPartnerCubit(this.partnerUseCase) : super(SearchPartnerState.initial());

  getPartner(PartnerRequiest partnerRequiest) async {
    emit(state.copyWith(status: CubitStatus.loading));
    var partnerData =
        await partnerUseCase.call(partnerRequiest: partnerRequiest);
    partnerData.fold((failure) {
      try {
        emit(state.copyWith(
            status: CubitStatus.faild, message: failure.response?.body));
      } catch (e) {
        emit(state.copyWith(status: CubitStatus.faild, message: e.toString()));
      }
    }, (data) {
      if (data.isNotEmpty) {
        UserPartnerInfo.partnerId = data.first.id;
        UserPartnerInfo.userId = data.first.prtnerId;
        UserPartnerInfo.userName = data.first.userName;
        UserPartnerInfo.partnerInfo = data;
      }
      emit(state.copyWith(status: CubitStatus.done, partner: data));
    });
  }
}
