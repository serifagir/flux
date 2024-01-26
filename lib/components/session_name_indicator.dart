import 'package:flutter/material.dart';
import 'package:flux/notifier/flux_notifier..dart';

class SessionNameIndicator extends StatefulWidget {
  final FluxNotifier notifier;

  const SessionNameIndicator({super.key, required this.notifier});

  @override
  State<SessionNameIndicator> createState() => _SessionNameIndicatorState();
}

class _SessionNameIndicatorState extends State<SessionNameIndicator> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.notifier.session == widget.notifier.currentSessionCount + 1
          ? 'Long Break'
          : widget.notifier.session % 2 == 0
              ? 'Flux'
              : 'Break',
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.primary),
    );
  }
}
