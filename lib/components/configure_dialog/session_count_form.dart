import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SessionCountForm extends StatefulWidget {
  int sessionCount = 2;
  final Function(int) onSessionCountChanged;

  SessionCountForm({
    super.key,
    required this.sessionCount,
    required this.onSessionCountChanged,
  });

  @override
  State<SessionCountForm> createState() => _SessionCountFormState();
}

class _SessionCountFormState extends State<SessionCountForm> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        isExpanded: true,
        icon: SizedBox.shrink(),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: "Session Count",
            labelStyle: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            )),
        items: ["2", "3", "4", "Custom"]
            .map((e) => DropdownMenuItem(
                alignment: Alignment.center,
                value: e,
                child: Text(e,
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w800))))
            .toList(),
        value: widget.sessionCount.toString(),
        onChanged: (e) => {
              setState(() {
                widget.sessionCount = int.parse(e!);
              })
            });
  }
}
