// ignore_for_file: file_names

import 'package:chat_2/core/error/failures.dart';
import 'package:chat_2/features/chat_partner/data/models/chat_bubble_model/chat_bubble_requiest.dart';
import 'package:chat_2/features/chat_partner/data/models/chat_bubble_model/chat_bubble_response.dart';
import 'package:chat_2/features/chat_partner/domain/repositories/chat_bubble_repository.dart';
import 'package:dartz/dartz.dart';

class ChatBubbleUseCases {
  final ChatBubbleRepository repository;

  const ChatBubbleUseCases({required this.repository});

  Future<Either<Failure, ChatBubbleResponse>> call(
      {required ChatBubbleRequiest chatBubleRequiest}) async {
    return await repository.chatbubble(chatBubleRequiest: chatBubleRequiest);
  }
}
