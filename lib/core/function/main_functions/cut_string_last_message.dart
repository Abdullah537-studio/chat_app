String cutStringLastMessage({required String lastMessage}) {
  lastMessage = lastMessage.length < 17
      ? lastMessage
      : "${lastMessage.substring(0, 12)}...";
  return lastMessage;
}
