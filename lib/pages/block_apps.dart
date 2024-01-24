import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlockAppsPage extends StatefulWidget {
  const BlockAppsPage({super.key});

  @override
  State<BlockAppsPage> createState() => _BlockAppsPageState();
}

class _BlockAppsPageState extends State<BlockAppsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Block Apps"),
      ),
    );
  }
}
