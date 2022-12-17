import 'package:xephas_chat/global/colors.dart';

import '../../chat_exporter.dart';

class ChatText extends StatelessWidget {
  /// user chat name
  final String textMessage;

  //
  const ChatText({
    super.key,
    required this.textMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textMessage,
      style: const TextStyle(
        fontSize: 16.0,
        color: whiteColor,
      ),
    );
  }
}
