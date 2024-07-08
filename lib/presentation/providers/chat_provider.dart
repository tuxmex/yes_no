import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{
  List<Message> messages = [
    Message(text: "Hola", fromWho: FromWho.mine),
    Message(text: "Mundo", fromWho: FromWho.mine),
  ];

  Future<void> sendMessage(String text) async{
    messages.add(Message(text: text, fromWho: FromWho.mine));
    print(messages);
  }

}