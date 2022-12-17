import '../chat_exporter.dart';




class ChatScreeny extends StatefulWidget {
  const ChatScreeny({super.key});

  @override
  State<ChatScreeny> createState() => _ChatScreenyState();
}

class _ChatScreenyState extends State<ChatScreeny> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return ChatBubble(
                    message: message,
                    isLastMessage: index == messages.length - 1,
                    isFirstMessage: index == 0,
                    index: index,
                  );
                },
              ),
            ),
          ),

          // TextInput(),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final Message message;
  final bool isLastMessage;
  final bool isFirstMessage;
  final int index;

  const ChatBubble({
    Key? key,
    required this.message,
    required this.isLastMessage,
    required this.isFirstMessage,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSender = message.isSender;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          if (isFirstMessage)
            Text(
              message.sender,
              style: const TextStyle(fontSize: 12.0, color: Colors.black54),
            ),
          // _buildBubble(context: context, index: index),
          buildBubblexx(context: context),
        ],
      ),
    );
  }

  // void name() {
  //   // get the list of all messages and then map them into sections based on the sender
  //   // i.e for massages with the same sender, they will be in the same section
  //   final sections = messages.map((message) => message.sender).toSet().toList();
  // }

  Widget buildBubblexx({required BuildContext context}) {
    // * sender
    final isSender = message.isSender;

    // section texts
    List<Message> sectionTexts = [];

    // get the current message at this index
    final currentMessage = messages[index];

    // if the message is from the sender then add it to the section texts
    // else clear the section texts and then add the current message to the section texts
    if (currentMessage.isSender) {
      sectionTexts.add(currentMessage);
    } else {
      sectionTexts.clear();
      sectionTexts.add(currentMessage);
    }

    // get the length of the section texts
    // final sectionTextsLength = sectionTexts.length;

    // late booleans for last and first messages in section texts
    // late bool isFirstSectionText;
    // late bool isLastSectionText;

    // //  loop through the section texts and check if the current message is the first or last message in the section texts and update them accordingly
    // for (int i = 0; i < sectionTextsLength; i++) {
    //   if (sectionTexts[i] == currentMessage) {
    //     isFirstSectionText = i == 0;
    //     isLastSectionText = i == sectionTextsLength - 1;
    //   }
    // }

    final nextMessage = isLastMessage ? messages[index] : messages[index + 1];

    //
    final prevMessage = isFirstMessage ? messages[index] : messages[index - 1];

    // get the next message in the section texts
    // final nextMessage =
    //     isLastSectionText ? currentMessage : sectionTexts[index + 1];

    // // get the prev message in the section texts
    // final prevMessage =
    //     isFirstSectionText ? currentMessage : sectionTexts[index - 1];

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
    // final isMessageAlone = !isConsecutiveMessage || isLastMessage;
    // if there is no previous message from the same sender and the next message is not from the same sender
    final isMessageAlone = currentMessage.isSender == isSender &&
        prevMessage.isSender != isSender &&
        nextMessage.isSender != isSender;
    // final isMessageAlone = isLastMessage && prevMessage.isSender != isSender;

    // is first message and is not consecutive i.e message is alone
    // final isMessageAlone = !isConsecutiveMessage;

    // if the sender of the current message and the next one is the same then add their texts to  list of messages
    // add the current message to the section list
    // sectionTexts.add(currentMessage);
    // if (currentMessage.isSender == nextMessage.isSender) {
    //   sectionTexts.add(nextMessage);
    // }

    // check if the current message is the last message in the list of section texts using isLast
    // final isLast = sectionTexts.last == currentMessage;
    // final isLast = isLastSectionText;
    // final isLast = isLastMessage;
    final isLast = isLastConsecutiveMessage;

    // check if the current message is the first message in the list of section texts using isFirst
    // final isFirst = sectionTexts.first == currentMessage;
    // final isFirst = isFirstSectionText;
    // final isFirst = isFirstMessage;
    final isFirst = isFirstConsecutiveMessage;

    // if the current message is the consecutive message in the list of section texts if its not first or last
    // final isConsecutive = !isFirst && !isLast;

    //* radi for the senders texts
    // for first message
    const firstSenderTextRadius = BorderRadius.only(
      topLeft: circularRadius16,
      topRight: circularRadius16,
      bottomLeft: circularRadius16,
      bottomRight: circularRadius4,
    );

    // for last message
    const lastSenderTextRadius = BorderRadius.only(
      topRight: circularRadius4,
      topLeft: circularRadius16,
      bottomLeft: circularRadius16,
      bottomRight: circularRadius16,
    );

    // for consecutive message
    const consecutiveSenderTextRadius = BorderRadius.only(
      topLeft: circularRadius16,
      bottomLeft: circularRadius16,
      topRight: circularRadius4,
      bottomRight: circularRadius4,
    );

    // senders chat bubble
    final sendersBubble = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.65,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF095AD2),
        borderRadius: isMessageAlone
            ? borderRadius16
            : isFirst
                ? firstSenderTextRadius
                : isLast
                    ? lastSenderTextRadius
                    : isConsecutiveMessage
                        ? consecutiveSenderTextRadius
                        : borderRadius16,
      ),
      child: Text(
        message.text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );

// * -----------------------------------------

    // * radi for the receivers texts (opposite of senders)
    // for first message
    const firstReceiverTextRadius = BorderRadius.only(
      topLeft: circularRadius16,
      topRight: circularRadius16,
      bottomLeft: circularRadius4,
      bottomRight: circularRadius16,
    );

    // for last message
    const lastReceiverTextRadius = BorderRadius.only(
      topRight: circularRadius16,
      topLeft: circularRadius4,
      bottomLeft: circularRadius16,
      bottomRight: circularRadius16,
    );

    // for consecutive message
    const consecutiveReceiverTextRadius = BorderRadius.only(
      topLeft: circularRadius4,
      bottomLeft: circularRadius4,
      topRight: circularRadius16,
      bottomRight: circularRadius16,
    );

    // receivers chat bubble
    final receiversBubble = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.65,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF19B687),
        borderRadius: isMessageAlone
            ? borderRadius16
            : isFirst
                ? firstReceiverTextRadius
                : isLast
                    ? lastReceiverTextRadius
                    : isConsecutiveMessage
                        ? consecutiveReceiverTextRadius
                        : borderRadius16,
      ),
      child: Text(
        message.text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );

    return isSender ? sendersBubble : receiversBubble;
  }

  Widget _buildBubble({
    required BuildContext context,
    required int index,
  }) {
    final isSender = message.isSender;
    final nextMessage = isLastMessage ? messages[index] : messages[index + 1];

    //
    final prevMessage = isFirstMessage ? messages[index] : messages[index - 1];
    final isConsecutive =
        prevMessage.isSender == isSender && nextMessage.isSender == isSender;

    // is first message and is not consecutive i.e message is alone
    final isMessageAlone = !isConsecutive;

    // get all messages and put them in a small list of messages which updates to override the current messages everytime the isSender parameter changes

    // topLeft, topRight, bottomRight for the sender's first message
    const firstMessageRadius = BorderRadius.only(
      topLeft: circularRadius16,
      topRight: circularRadius16,
      bottomLeft: circularRadius16,
      bottomRight: circularRadius4,
    );

    // topRight, bottomRight, bottomLeft for the last message
    const lastMessageRadius = BorderRadius.only(
      topLeft: circularRadius4,
      topRight: circularRadius16,
      bottomLeft: circularRadius16,
      bottomRight: circularRadius16,
    );

    // topLeft, bottomLeft for the sender's consecutive message
    const consecutiveMessageRadius = BorderRadius.only(
      topLeft: circularRadius16,
      bottomLeft: circularRadius16,
      topRight: circularRadius4,
      bottomRight: circularRadius4,
    );

    //
    final radius = isMessageAlone
        ? borderRadius16
        : isFirstMessage
            ? firstMessageRadius
            : isLastMessage
                ? lastMessageRadius
                : consecutiveMessageRadius;

    //  BorderRadius.only(
    //     topLeft: Radius.circular(isFirstMessage ? 8.0 : 0.0),
    //     topRight: Radius.circular(
    //       isFirstMessage
    //           ? 8.0
    //           : isConsecutive
    //               ? 0.0
    //               : 8.0,
    //     ),
    //     bottomLeft: Radius.circular(
    //       isConsecutive
    //           ? 0.0
    //           : isFirstMessage
    //               ? 8.0
    //               : 0.0,
    //     ),
    //     bottomRight: Radius.circular(isLastMessage ? 8.0 : 0.0),
    //   );

    //
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.65,
      ),
      decoration: BoxDecoration(
        color: isSender ? Colors.blue : Colors.red[200],
        borderRadius: radius,
      ),
      child: Text(
        message.text,
        style: TextStyle(
          color: isSender ? Colors.white : Colors.black,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
