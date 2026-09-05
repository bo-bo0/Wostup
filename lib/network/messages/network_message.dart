class NetworkMessage {
  const NetworkMessage({
    required this.recipientNumber,
    required this.senderNumber,
    required this.content,
    required this.sentDateTime
  });

  final String recipientNumber;
  final String senderNumber;
  final String content;
  final DateTime sentDateTime;
}