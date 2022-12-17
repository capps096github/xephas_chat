import '../chat_exporter.dart';

List<Message> messages = [
  Message(
    sender: 'John',
    text: 'Hey there!',
    isSender: true,
  ),
  Message(
    sender: 'John',
    text: 'Hey there!',
    isSender: true,
  ),
  Message(
    sender: 'John',
    text: 'Hi',
    isSender: true,
  ),
  Message(
    sender: 'John',
    text: 'Bizzzz!' * 4,
    isSender: true,
  ),
  Message(
    sender: 'John',
    text: 'Hey there!' * 5,
    isSender: true,
  ),
  Message(
    sender: 'Jane',
    text: 'Hi John, how are you?',
    isSender: false,
  ),
  Message(
    sender: 'Jane',
    text: 'Your good?',
    isSender: false,
  ),
  Message(
    sender: 'Jane',
    text: 'I miss you',
    isSender: false,
  ),
  Message(
    sender: 'John',
    text: "'I'm doing well, thanks for asking. How about you?'",
    isSender: true,
  ),
  Message(
    sender: 'John',
    text: "Can we meet",
    isSender: true,
  ),
  Message(
    sender: 'Jane',
    text: "'I'm doing well too, thanks. So, what's new with you?'",
    isSender: false,
  ),
  Message(
    sender: 'Jane',
    text: "'I'm doing well too,",
    isSender: false,
  ),
  Message(
    sender: 'Jane',
    text: "Lol XOXO",
    isSender: false,
  ),
];
