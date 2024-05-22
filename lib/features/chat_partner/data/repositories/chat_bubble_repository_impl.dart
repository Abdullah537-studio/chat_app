import 'package:chat_2/core/error/exception.dart';
import 'package:chat_2/core/error/failures.dart';
import 'package:chat_2/core/network/network_info.dart';
import 'package:chat_2/core/strings/error_strings.dart';
import 'package:chat_2/features/chat_partner/data/datasources/chat_bubble_remote_data.dart';
import 'package:chat_2/features/chat_partner/data/models/chat_bubble_model/chat_bubble_requiest.dart';
import 'package:chat_2/features/chat_partner/data/models/chat_bubble_model/chat_bubble_response.dart';
import 'package:chat_2/features/chat_partner/data/models/chat_info_model/chat_partner_model.dart';
import 'package:chat_2/features/chat_partner/data/models/dialog_chat_model/dialog_chat_response.dart';
import 'package:chat_2/features/chat_partner/domain/repositories/chat_bubble_repository.dart';
import 'package:dartz/dartz.dart';

class ChatBubbleRepositoryImpl implements ChatBubbleRepository {
  final NetworkInfo networkInfo;
  final ChatBubbleRemoteData remoteData;
  ChatBubbleRepositoryImpl(
      {required this.networkInfo, required this.remoteData});

//! chat bubble
  @override
  Future<Either<Failure, ChatBubbleResponse>> chatbubble(
      {required ChatBubbleRequiest chatBubleRequiest}) async {
    if (await networkInfo.isConnected) {
      try {
        var chatBubleData =
            await remoteData.chatBuble(chatBubbleEntity: chatBubleRequiest);
        return Right(chatBubleData);
      } on ServerException catch (e) {
        return Left(
            Failure(response: e.response, error: serverExceptionString));
      }
    } else {
      return Left(
        Failure(error: offlineExceptionString),
      );
    }
  }

//! chat dialog
  @override
  Future<Either<Failure, DialogChatResponse>> chatDialog() async {
    if (await networkInfo.isConnected) {
      try {
        var chatDialogData = await remoteData.chatDialog();
        return Right(chatDialogData);
      } on ServerException catch (e) {
        return Left(
          Failure(response: e.response, error: serverExceptionString),
        );
      }
    } else {
      return Left(
        Failure(error: offlineExceptionString),
      );
    }
  }

  //!---------------------info
  @override
  Future<Either<Failure, List<ChatPartnerModel>>> chatPartnerInfo() async {
    if (await networkInfo.isConnected) {
      try {
        final chatPartner = await remoteData.getAllChatPartner();
        return Right(chatPartner);
      } on ServerException catch (e) {
        return Left(
            Failure(error: serverExceptionString, response: e.response));
      }
    } else {
      return Left(Failure(error: offlineExceptionString));
    }
  }
}
