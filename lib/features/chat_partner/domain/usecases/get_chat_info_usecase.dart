import 'package:chat_2/core/error/failures.dart';
import 'package:chat_2/features/chat_partner/data/models/chat_info_model/chat_partner_model.dart';
import 'package:chat_2/features/chat_partner/domain/repositories/chat_bubble_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllChatPartnerUseCase {
  final ChatBubbleRepository repository;
  const GetAllChatPartnerUseCase({required this.repository});

  Future<Either<Failure, List<ChatPartnerModel>>> call() async {
    return await repository.chatPartnerInfo();
  }
}
