import '../chat_exporter.dart';

//
const circularRadius16 = Radius.circular(16);

const circularRadius4 = Radius.circular(4);

// border radius 16
const borderRadius16 = BorderRadius.all(Radius.circular(16));

// * ---------------------------------------------------------------------
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

// * ---------------------------------------------------------------------

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
