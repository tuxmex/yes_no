import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final outlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.transparent)
    );
    
    final inputDecoration = InputDecoration(
      hintText: 'Termina el mensaje con "?"',
      enabledBorder:  outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        onPressed: (){
          final textValue = textController.value.text;
          print('button: $textValue');
          chatProvider.sendMessage(textValue);
          textController.clear();
        },
       icon: const Icon(Icons.send_outlined),
       )
    );
    return  TextFormField(
      onTapOutside: (event){
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value){
        print('Submit value $value');
        chatProvider.sendMessage(value);
        textController.clear();
        focusNode.requestFocus();
      },
      onChanged: (value){

      },
    );
  }
}