import 'package:youtube/screens/user_model.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: support,
    time: '5:30 PM',
    text: 'This is customer support.',
    unread: true,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Hello',
    unread: true,
  ),
  Message(
    sender: support,
    time: '5:30 PM',
    text: 'Hello! This is customer support. How can we help you?',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Message',
    unread: true,
  ),
  Message(
    sender: support,
    time: '3:45 PM',
    text: 'message',
    unread: true,
  ),
  Message(
    sender: support,
    time: '3:15 PM',
    text: 'message',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'message',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'message',
    unread: true,
  ),
  Message(
    sender: support,
    time: '2:00 PM',
    text: 'Thanks for reaching us out.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Hello!',
    unread: true,
  ),
];
