import 'package:chat_2/core/error/failures.dart';
import 'package:chat_2/features/chat_partner/data/models/dialog_chat_model/dialog_chat_response.dart';
import 'package:chat_2/features/chat_partner/domain/repositories/chat_bubble_repository.dart';
import 'package:dartz/dartz.dart';

class ChatDialogUseCase {
  final ChatBubbleRepository repository;

  const ChatDialogUseCase({required this.repository});

  Future<Either<Failure, DialogChatResponse>> call() async {
    return await repository.chatDialog();
  }
}
