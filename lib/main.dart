import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void playSound(int soundNo) {
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNo.wav'));
  }

  Expanded giveButton({soundNo,colorName}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(soundNo);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(colorName),
        ),
        child: const Text(""),
      ),
    );
  }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              giveButton(soundNo: 1, colorName: Colors.red),
              giveButton(soundNo: 2, colorName: Colors.orange),
              giveButton(soundNo: 3, colorName: Colors.yellow),
              giveButton(soundNo: 4, colorName: Colors.green),
              giveButton(soundNo: 5, colorName: Colors.teal),
              giveButton(soundNo: 6, colorName: Colors.blue),
              giveButton(soundNo: 7, colorName: Colors.pink),
            ],
          ),
        ),
      ),
    );
  }
}
