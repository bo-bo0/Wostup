import 'package:wostup/data/messages/chat_message.dart';
import 'package:wostup/data/messages/chat_message_owner.dart';
import 'package:wostup/data/messages/chat_messages_registry.dart';
import 'package:wostup/data/user/user_info.dart';
import 'package:wostup/network/messages/message_poster.dart';
import 'package:wostup/network/messages/network_message.dart';

final class ChatHelper {
  static void sendMessageInCurrentlyOpenedChat(String message) async {
    await MessagePoster.sendTo(NetworkMessage(
        recipientNumber: ChatMessagesRegistry.currentlyOpenChatNumber!,
        senderNumber: UserInfo.info!.number,
        content: message,
        sentDateTime: DateTime.now()
    ));

    ChatMessagesRegistry.addMessageToChat(
        ChatMessagesRegistry.currentlyOpenChatNumber!,
        ChatMessage(
            content: message,
            owner: ChatMessageOwner.user
        )
    );
  }
}