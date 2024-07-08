import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat_screen.dart';
import 'config/theme/app_theme.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final int selectedColor;
  const MainApp({super.key, this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < colorThemes.length,
            'El color se debe encontrar entre 0 y ${colorThemes.length - 1}');

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(create: (_)=>ChatProvider())
      ],
      child: MaterialApp(
        title: 'Material app',
        debugShowCheckedModeBanner: false,
      theme: MainApp(selectedColor: 3,).theme(),
      home: const ChatScreen(),
    ),
    );
  }
  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: colorThemes[selectedColor],
    );
  }
}