import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FluxDurationForm extends StatefulWidget {
  int fluxDuration;
  final Function(int) onFluxDurationChanged;

  FluxDurationForm({
    super.key,
    required this.fluxDuration,
    required this.onFluxDurationChanged,
  });

  @override
  State<FluxDurationForm> createState() => _FluxDurationFormState();
}

class _FluxDurationFormState extends State<FluxDurationForm> {
  int fluxDuration = 15;
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
        items: ["15", "25", "30", "40", "50", "60", "Custom"]
            .map((e) => DropdownMenuItem(
                alignment: Alignment.center,
                value: e,
                child: Text(e,
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w800))))
            .toList(),
        value: fluxDuration.toString(),
        onChanged: (e) => {
              setState(() {
                fluxDuration = int.parse(e!);
                widget.fluxDuration = int.parse(e!);
                print("widget.fluxDuration: ${widget.fluxDuration}");
                print("fluxDuration: $fluxDuration");
                widget.onFluxDurationChanged(fluxDuration);
              })
            });
  }
}
