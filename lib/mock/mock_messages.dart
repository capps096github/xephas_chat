import '../chat_exporter.dart';

List<Message> messages = [
  Message(
    sender: 'Cephas',
    text: 'Hey there!',
    isSender: true,
  ),
  Message(
    sender: 'Cephas',
    text: 'Hey there!',
    isSender: true,
  ),
  Message(
    sender: 'Cephas',
    text: 'Hi',
    isSender: true,
  ),
  Message(
    sender: 'Cephas',
    text: 'Bizzzz!' * 4,
    isSender: true,
  ),
  Message(
    sender: 'Cephas',
    text: 'Hey there!' * 5,
    isSender: true,
  ),
  Message(
    sender: 'Brian',
    text: 'Hi Cephas, how are you?',
    isSender: false,
  ),
  Message(
    sender: 'Brian',
    text: 'Your good?',
    isSender: false,
  ),
  Message(
    sender: 'Brian',
    text: 'I miss you',
    isSender: false,
  ),
  Message(
    sender: 'Cephas',
    text: "'I'm doing well, thanks for asking. How about you?'",
    isSender: true,
  ),
  Message(
    sender: 'Cephas',
    text: "Can we meet",
    isSender: true,
  ),
  Message(
    sender: 'Brian',
    text: "'I'm doing well too, thanks. So, what's new with you?'",
    isSender: false,
  ),
  Message(
    sender: 'Brian',
    text: "'I'm doing well too,",
    isSender: false,
  ),
  Message(
    sender: 'Brian',
    text: "Lol XOXO",
    isSender: false,
  ),
];
