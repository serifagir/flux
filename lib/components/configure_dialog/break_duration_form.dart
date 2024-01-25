import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BreakDurationForm extends StatefulWidget {
  int breakDuration;
  final Function(int) onBreakDurationChanged;

  BreakDurationForm({
    super.key,
    required this.breakDuration,
    required this.onBreakDurationChanged,
  });

  @override
  State<BreakDurationForm> createState() => _BreakDurationFormState();
}

class _BreakDurationFormState extends State<BreakDurationForm> {
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
        items: ["5", "10", "15", "Custom"]
            .map((e) => DropdownMenuItem(
                alignment: Alignment.center,
                value: e,
                child: Text(e,
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w800))))
            .toList(),
        value: widget.breakDuration.toString(),
        onChanged: (e) => {
              setState(() {
                widget.breakDuration = int.parse(e!);
              })
            });
  }
}
