import 'package:chat_2/core/error/failures.dart';
import 'package:chat_2/features/chat_partner/data/models/chat_bubble_model/chat_bubble_requiest.dart';
import 'package:chat_2/features/chat_partner/data/models/chat_bubble_model/chat_bubble_response.dart';
import 'package:chat_2/features/chat_partner/data/models/chat_info_model/chat_partner_model.dart';
import 'package:chat_2/features/chat_partner/data/models/dialog_chat_model/dialog_chat_response.dart';
import 'package:dartz/dartz.dart';

abstract class ChatBubbleRepository {
  Future<Either<Failure, ChatBubbleResponse>> chatbubble(
      {required ChatBubbleRequiest chatBubleRequiest});
  Future<Either<Failure, DialogChatResponse>> chatDialog();
  Future<Either<Failure, List<ChatPartnerModel>>> chatPartnerInfo();
}
