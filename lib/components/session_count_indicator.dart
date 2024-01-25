import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SessionCountIndicator extends StatelessWidget {
  const SessionCountIndicator({
    super.key,
    required this.sessionCount,
  });

  final int sessionCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        sessionCount, // Replace this with your session count variable
        (index) => Container(
          margin: EdgeInsets.all(5.0),
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            color: Colors.transparent, // Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
