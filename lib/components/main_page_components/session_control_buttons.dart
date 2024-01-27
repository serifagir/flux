import 'package:flutter/material.dart';

class SessionControlButtons extends StatelessWidget {
  const SessionControlButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.play_arrow),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.pause),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.stop),
          onPressed: () {},
        ),
      ],
    );
  }
}
