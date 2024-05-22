import 'dart:convert';

DialogChatResponseList chatDialogFromJson(String str) =>
    DialogChatResponseList.fromJson(json.decode(str));

class DialogChatResponseList {
  DialogChatResponseList({
    required this.result,
  });

  final DialogChatResponse? result;

  factory DialogChatResponseList.fromJson(Map<String, dynamic> json) {
    return DialogChatResponseList(
      result: json["result"] == null
          ? null
          : DialogChatResponse.fromJson(json["result"]),
    );
  }
}

class DialogChatResponse {
  DialogChatResponse({
    required this.id,
    required this.accountId,
    required this.fullName,
    required this.contactId,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.dialogs,
  });

  final String id;
  final dynamic accountId;
  final dynamic fullName;
  final dynamic contactId;
  final dynamic lastMessage;
  final DateTime? lastMessageTime;
  final List<Dialog> dialogs;

  factory DialogChatResponse.fromJson(Map<String, dynamic> json) {
    return DialogChatResponse(
      id: json["id"] ?? "",
      accountId: json["accountId"],
      fullName: json["fullName"],
      contactId: json["contactId"],
      lastMessage: json["lastMessage"],
      lastMessageTime: DateTime.tryParse(json["lastMessageTime"] ?? ""),
      dialogs: json["dialogs"] == null
          ? []
          : List<Dialog>.from(json["dialogs"]!.map((x) => Dialog.fromJson(x))),
    );
  }
}

class Dialog {
  Dialog({
    required this.who,
    required this.message,
    required this.chatid,
    required this.time,
    required this.id,
  });

  final int who;
  final String message;
  final String chatid;
  final DateTime? time;
  final int id;

  factory Dialog.fromJson(Map<String, dynamic> json) {
    return Dialog(
      who: json["who"] ?? 0,
      message: json["message"] ?? "",
      chatid: json["chatid"] ?? "",
      time: DateTime.tryParse(json["time"] ?? ""),
      id: json["id"] ?? 0,
    );
  }
}
