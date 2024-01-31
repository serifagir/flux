import 'package:flutter/material.dart';

class BlockAps extends StatefulWidget {
  const BlockAps({super.key});

  @override
  State<BlockAps> createState() => _BlockApssState();
}

class _BlockApssState extends State<BlockAps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Block apps'),
      ),
    );
  }
}
