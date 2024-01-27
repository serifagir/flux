import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux/components/main_page_components/session_control_buttons.dart';

import 'package:flux/components/main_page_components/session_timer.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          Positioned(
              bottom: size.width * 0.1,
              left: size.width * 0.02,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.gear_alt, size: 30))),
          Positioned(
              bottom: size.width * 0.1,
              left: size.width * 0.13,
              child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                            title: Text("Configure Flux"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FluxDurationForm(),
                                SizedBox(height: 10),
                                BreakDurationForm(),
                                SizedBox(height: 10),
                                LongBreakDurationForm(),
                                SizedBox(height: 10),
                                SessionCountForm(),
                                SizedBox(height: 10),
                                SamuraiModeForm(),
                              ],
                            )));
                  },
                  icon: const Icon(
                    CupertinoIcons.waveform,
                    size: 30,
                  ))),
          Positioned(
              bottom: size.width * 0.1,
              right: size.width * 0.02,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.chart_bar_square, size: 30))),
          Positioned(
              bottom: size.width * 0.1,
              right: size.width * 0.13,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.paintbrush,
                    size: 30,
                  ))),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: SessionTimer()),
              SessionControlButtons(),
            ],
          ),
        ],
      )),
    );
  }
}

class FluxDurationForm extends StatelessWidget {
  const FluxDurationForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: false,
      icon: SizedBox.shrink(),
      onChanged: (value) {},
      decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          labelText: "Flux Duration"),
      items: <String>['10', '15', '25', '30', '45', '50', '60', 'Custom']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class BreakDurationForm extends StatelessWidget {
  const BreakDurationForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: SizedBox.shrink(),
      onChanged: (value) {},
      decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          labelText: "Break Duration"),
      items: <String>['1', '5', '10', '15', 'Custom']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class LongBreakDurationForm extends StatelessWidget {
  const LongBreakDurationForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: SizedBox.shrink(),
      onChanged: (value) {},
      decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          labelText: "Long Break Duration"),
      items: <String>['20', '30', '40', 'Custom']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class SessionCountForm extends StatelessWidget {
  const SessionCountForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: SizedBox.shrink(),
      onChanged: (value) {},
      decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          labelText: "Session Count"),
      items: <String>['2', '3', '4', 'Custom']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class SamuraiModeForm extends StatelessWidget {
  const SamuraiModeForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Samurai Mode",
          style: GoogleFonts.poppins(
            color: Colors.red,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Switch(
          activeColor: Colors.red,
          inactiveTrackColor: Colors.grey,
          inactiveThumbColor: Theme.of(context).colorScheme.primary,
          value: true,
          onChanged: (value) {},
        )
      ],
    );
  }
}
