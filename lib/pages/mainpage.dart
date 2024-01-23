import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:flux/pages/settings.dart';
import 'package:flux/pages/stats.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void editFlux() {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Text(
                  "Configure",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
                ),
                content: const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Flux Duration"),
                        DropdownMenu(
                          dropdownMenuEntries: [],
                        )
                      ],
                    ),
                    Text("Break Duration"),
                    Text("Settings"),
                  ],
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Save"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: size.height * 0.05,
            left: 15,
            child: IconButton(
              icon: const Icon(
                CupertinoIcons.waveform,
                size: 30,
              ),
              onPressed: () => editFlux(),
            ),
          ),
          Positioned(
            bottom: size.height * 0.05,
            right: 15,
            child: IconButton(
              icon: const Icon(
                Icons.analytics_outlined,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("flux",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary)),
                TimerCountdown(
                    enableDescriptions: false,
                    format: CountDownTimerFormat.hoursMinutes,
                    colonsTextStyle: TextStyle(
                        fontSize: 75,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary),
                    timeTextStyle: GoogleFonts.roboto(
                        fontSize: 100,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary),
                    endTime: DateTime.now().add(
                      Duration(
                        hours: 14,
                        minutes: 27,
                        seconds: 34,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      width: 10,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
