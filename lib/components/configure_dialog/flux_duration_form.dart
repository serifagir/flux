import 'package:flutter/material.dart';
import 'package:flux/notifier/flux_notifier..dart';
import 'package:google_fonts/google_fonts.dart';

class FluxDurationForm extends StatefulWidget {
  final Function(int) onFluxDurationChanged;
  final FluxNotifier notifier;

  const FluxDurationForm({
    super.key,
    required this.onFluxDurationChanged,
    required this.notifier,
  });

  @override
  State<FluxDurationForm> createState() => _FluxDurationFormState();
}

class _FluxDurationFormState extends State<FluxDurationForm> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        isExpanded: true,
        icon: SizedBox.shrink(),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: "Flux Duration",
            labelStyle: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            )),
        items: ["1", "15", "25", "30", "40", "50", "60", "Custom"]
            .map((e) => DropdownMenuItem(
                alignment: Alignment.center,
                value: e,
                child: Text(e,
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w800))))
            .toList(),
        value: widget.notifier.currentFluxDuration.toString(),
        onChanged: (e) => {
              setState(() {
                widget.notifier.currentFluxDuration = int.parse(e!);
                widget
                    .onFluxDurationChanged(widget.notifier.currentFluxDuration);
              })
            });
  }
}
