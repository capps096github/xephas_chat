import 'package:xephas_chat/global/colors.dart';

import '../../chat_exporter.dart';
import 'chat_name.dart';
import 'chat_text.dart';

class XephasChatBubble extends StatelessWidget {
  final Message message;
  final bool isLastMessage;
  final bool isFirstMessage;
  final int index;

  const XephasChatBubble({
    Key? key,
    required this.message,
    required this.isLastMessage,
    required this.isFirstMessage,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // * sender
    final isSender = message.isSender;

    // get the current message at this index
    final currentMessage = messages[index];

    final nextMessage = isLastMessage ? messages[index] : messages[index + 1];

    //
    final prevMessage = isFirstMessage ? messages[index] : messages[index - 1];

    //
    final isConsecutiveMessage = (currentMessage.isSender == isSender &&
            prevMessage.isSender == isSender) ||
        nextMessage.isSender == isSender;

    // is last if current message is from same sender, the previous from same sender and the next is from another sender
    final isLastConsecutiveMessage = (currentMessage.isSender == isSender &&
                prevMessage.isSender == isSender) &&
            nextMessage.isSender != isSender ||
        isLastMessage;

    // is first if the previous message sender is different or if this is the first message in the list
    final isFirstConsecutiveMessage =
        (prevMessage.isSender != isSender) || isFirstMessage;

    // message is alone if it is not consecutive that is the previous message sender is not the same and the next message sender is not the same or if the message is the last in the list
    // if there is no previous message from the same sender and the next message is not from the same sender
    final isMessageAlone = currentMessage.isSender == isSender &&
        prevMessage.isSender != isSender &&
        nextMessage.isSender != isSender;

    // check if the current message is the last message in the list of section texts using isLast
    final isLast = isLastConsecutiveMessage;

    // check if the current message is the first message in the list of section texts using isFirst
    final isFirst = isFirstConsecutiveMessage;

    // sender border radius
    final senderBorderRadius = isMessageAlone
        ? borderRadius16
        : isFirst
            ? firstSenderTextRadius
            : isLast
                ? lastSenderTextRadius
                : isConsecutiveMessage
                    ? consecutiveSenderTextRadius
                    : borderRadius16;

    // receiver border radius
    final receiverBorderRadius = isMessageAlone
        ? borderRadius16
        : isFirst
            ? firstReceiverTextRadius
            : isLast
                ? lastReceiverTextRadius
                : isConsecutiveMessage
                    ? consecutiveReceiverTextRadius
                    : borderRadius16;

    // bubble border radius
    final bubbleBorderRadius =
        isSender ? senderBorderRadius : receiverBorderRadius;

    // chat color
    final chatBubbleColor = isSender ? chatColor : receiverChatColor;

    // chat crossAxisAlignment
    final chatCrossAxisAlignment =
        isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start;

    //
    return ChatBubbleBody(
      chatCrossAxisAlignment: chatCrossAxisAlignment,
      isFirst: isFirst,
      message: message,
      chatBubbleColor: chatBubbleColor,
      bubbleBorderRadius: bubbleBorderRadius,
    );
  }
}

class ChatBubbleBody extends StatelessWidget {
  const ChatBubbleBody({
    Key? key,
    required this.chatCrossAxisAlignment,
    required this.isFirst,
    required this.message,
    required this.chatBubbleColor,
    required this.bubbleBorderRadius,
  }) : super(key: key);

  final CrossAxisAlignment chatCrossAxisAlignment;
  final bool isFirst;
  final Message message;
  final Color chatBubbleColor;
  final BorderRadius bubbleBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Column(
        crossAxisAlignment: chatCrossAxisAlignment,
        children: <Widget>[
          if (isFirst)
            ChatName(
              name: message.sender,
              nameColor: chatBubbleColor,
            ),

          //
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
              color: chatBubbleColor,
              borderRadius: bubbleBorderRadius,
            ),
            child: ChatText(textMessage: message.text),
          ),
        ],
      ),
    );
  }
}
