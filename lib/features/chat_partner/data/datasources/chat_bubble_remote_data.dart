import 'package:chat_2/core/api/api_links.dart';
import 'package:chat_2/core/api/api_methods.dart';
import 'package:chat_2/core/error/exception.dart';
import 'package:chat_2/features/chat_partner/data/models/chat_bubble_model/chat_bubble_requiest.dart';
import 'package:chat_2/features/chat_partner/data/models/chat_bubble_model/chat_bubble_response.dart';
import 'package:chat_2/features/chat_partner/data/models/chat_info_model/chat_partner_model.dart';
import 'package:chat_2/features/chat_partner/data/models/dialog_chat_model/dialog_chat_response.dart';
import 'package:flutter/material.dart';

abstract class ChatBubbleRemoteData {
  Future<ChatBubbleResponse> chatBuble(
      {required ChatBubbleRequiest chatBubbleEntity});
  Future<DialogChatResponse> chatDialog();
  Future<List<ChatPartnerModel>> getAllChatPartner();
}

class ChatBubbleRemoteDataImpl implements ChatBubbleRemoteData {
  //!---------------- chat bubble --------------------------------------

  @override
  Future<ChatBubbleResponse> chatBuble(
      {required ChatBubbleRequiest chatBubbleEntity}) async {
    var response = await ApiMethods().post(
      url: ApiPost.chatpartnerbubble,
      body: chatBubbleRequestToJson(chatBubbleEntity),
      query: {},
    );

    debugPrint(response.body);
    if (response.statusCode == 200) {
      return chatBubleResponseFromJson(response.body).result!;
    } else {
      throw ServerException(response: response);
    }
  }

//!---------------- get chat dialog by id ---------------------------------
  @override
  Future<DialogChatResponse> chatDialog() async {
    var response = await ApiMethods().get(
      url: ApiGet.getAllChatByIdPartner,
      path: {},
      query: {},
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      return chatDialogFromJson(response.body).result!;
    } else {
      throw ServerException(response: response);
    }
  }

  //!------------------chat partner info
  @override
  Future<List<ChatPartnerModel>> getAllChatPartner() async {
    var response = await ApiMethods().get(
      url: ApiGet.getAllchatListDialog,
      path: {},
      query: {},
    );
    debugPrint(response.body);

    if (response.statusCode == 200) {
      return chatpartnerModelFromJson(response.body).result;
    } else {
      throw ServerException(response: response);
    }
  }
}
