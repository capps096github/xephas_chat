import 'package:xephas_chat/global/colors.dart';

import '../../chat_exporter.dart';

class ChatName extends StatelessWidget {
  /// user chat name
  final String name;

  // chat color
  final Color nameColor;

  //
  const ChatName({
    super.key,
    required this.name,
    this.nameColor = chatColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 14.0,
        color: nameColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
