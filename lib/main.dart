import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xylophone',
      home: Xylophone(),
    );
  }
}

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Xylophone"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: () async {
              final player = AudioPlayer();
              await player.play(
                AssetSource('audio/note1.wav'),
              );
            },
            child: const Text("Click me"),
          ),
        ),
      ),
    );
  }
}
