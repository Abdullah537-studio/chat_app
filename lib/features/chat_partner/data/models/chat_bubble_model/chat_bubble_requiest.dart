chatBubbleRequestToJson(ChatBubbleRequiest data) => data.toJson();

class ChatBubbleRequiest {
  ChatBubbleRequiest({
    this.recipientId = 0,
    this.who = 0,
    this.message = '',
    this.time,
  });

  int? recipientId;
  int? who;
  String? message;
  DateTime? time;

  Map<String, dynamic> toJson() {
    return {
      "recipientID": recipientId,
      "who": who,
      "message": message,
      "time": time?.toIso8601String(),
    };
  }
}
