import '../chat_exporter.dart';
import 'components/chat_bubble.dart';

class XephasChat extends StatefulWidget {
  const XephasChat({super.key});

  @override
  State<XephasChat> createState() => _XephasChatState();
}

class _XephasChatState extends State<XephasChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF095AD2),
        title: const Text('Xephas Chat'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return XephasChatBubble(
                    message: message,
                    isLastMessage: index == messages.length - 1,
                    isFirstMessage: index == 0,
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
