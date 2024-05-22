import 'dart:convert';

ChatBubbleResponseResult chatBubleResponseFromJson(String str) =>
    ChatBubbleResponseResult.fromJson(json.decode(str));

class ChatBubbleResponseResult {
  const ChatBubbleResponseResult({required this.result});

  final ChatBubbleResponse? result;

  factory ChatBubbleResponseResult.fromJson(Map<String, dynamic> json) {
    return ChatBubbleResponseResult(
      result: json["result"] == null
          ? null
          : ChatBubbleResponse.fromJson(json["result"]),
    );
  }
}

class ChatBubbleResponse {
  ChatBubbleResponse({
    required this.recipientId,
    required this.who,
    required this.message,
    required this.time,
  });

  final int recipientId;
  final int who;
  final String message;
  final DateTime? time;

  factory ChatBubbleResponse.fromJson(Map<String, dynamic> json) {
    return ChatBubbleResponse(
      recipientId: json["recipientID"] ?? 0,
      who: json["who"] ?? 0,
      message: json["message"] ?? "",
      time: DateTime.tryParse(json["time"] ?? ""),
    );
  }
}
