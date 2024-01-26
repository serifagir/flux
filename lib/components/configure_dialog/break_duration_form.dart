import 'package:flutter/material.dart';

import 'package:flux/notifier/flux_notifier.dart';
import 'package:google_fonts/google_fonts.dart';

class BreakDurationForm extends StatefulWidget {
  FluxNotifier notifier;
  final Function(int) onBreakDurationChanged;

  BreakDurationForm({
    super.key,
    required this.notifier,
    required this.onBreakDurationChanged,
  });

  @override
  State<BreakDurationForm> createState() => _BreakDurationFormState();
}

class _BreakDurationFormState extends State<BreakDurationForm> {
  int breakDuration = 15;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        isExpanded: true,
        icon: SizedBox.shrink(),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: "Break Duration",
            labelStyle: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            )),
        items: ["1", "5", "10", "15", "Custom"]
            .map((e) => DropdownMenuItem(
                alignment: Alignment.center,
                value: e,
                child: Text(e,
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w800))))
            .toList(),
        value: widget.notifier.breakDurationInMinutes.toString(),
        onChanged: (e) => {
              setState(() {
                widget.notifier.breakDurationInMinutes = int.parse(e!);
                widget.onBreakDurationChanged(
                    widget.notifier.breakDurationInMinutes);
              })
            });
  }
}
