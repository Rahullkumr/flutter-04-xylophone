import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xylophone',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("Xylophone"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: TextButton(
              onPressed: ()  {
                 player.play(
                  AssetSource('note1.wav'),
                );
              },
              child: const Text("Click me"),
            ),
          ),
        ),
      ),
    );
  }
}
