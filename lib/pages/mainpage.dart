import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux/components/countdown_controller_button.dart';
import 'package:flux/notifier/flux_notifier..dart';
import 'package:flux/pages/block_apps.dart';
import 'package:flux/pages/settings.dart';
import 'package:flux/pages/stats.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String fluxDuration = "15";
  int breakDuration = 5;
  int longBreakDuration = 30;
  int sessionCount = 4;
  int countdownSeconds = 2;

  DateTime remainingTime = DateTime.now().add(Duration(minutes: 15));

  final CountdownController _countdownController =
      new CountdownController(autoStart: true);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FluxNotifier>(
      builder: (_, notifier, __) => Scaffold(
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
                    onPressed: () {
                      if (!notifier.isTimerRunning) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 5),
                                child: AlertDialog(
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .background
                                      .withOpacity(0.8),
                                  title: Text("Configure",
                                      style: GoogleFonts.poppins(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w800)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      DropdownButtonFormField(
                                          isExpanded: true,
                                          icon: SizedBox.shrink(),
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              labelText: "Flux Duration",
                                              labelStyle: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          items: [
                                            "15",
                                            "25",
                                            "30",
                                            "40",
                                            "50",
                                            "60",
                                            "Custom"
                                          ]
                                              .map((e) => DropdownMenuItem(
                                                  alignment: Alignment.center,
                                                  value: e,
                                                  child: Text(e,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800))))
                                              .toList(),
                                          value: fluxDuration,
                                          onChanged: (e) => {
                                                setState(() {
                                                  fluxDuration = e!;
                                                })
                                              }),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      DropdownButtonFormField(
                                          isExpanded: true,
                                          icon: SizedBox.shrink(),
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800))))
                                              .toList(),
                                          value: breakDuration.toString(),
                                          onChanged: (e) => {
                                                setState(() {
                                                  breakDuration = int.parse(e!);
                                                })
                                              }),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      DropdownButtonFormField(
                                          isExpanded: true,
                                          icon: SizedBox.shrink(),
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800))))
                                              .toList(),
                                          value: sessionCount.toString(),
                                          onChanged: (e) => {
                                                setState(() {
                                                  sessionCount = int.parse(e!);
                                                })
                                              }),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      GestureDetector(
                                        onTap: () => showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("Ticking Sound",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                    Switch(
                                                      value: notifier
                                                          .isTickingSoundOn,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          notifier.isTickingSoundOn =
                                                              value;
                                                        });
                                                      },
                                                      activeTrackColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .primary,
                                                      activeColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .background,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("Background Sound",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                    Switch(
                                                      value: notifier
                                                          .isBackgroundSoundOn,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          notifier.isBackgroundSoundOn =
                                                              value;
                                                        });
                                                      },
                                                      activeTrackColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .primary,
                                                      activeColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .background,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("Notifications",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                    Switch(
                                                      value: notifier
                                                          .isNotificationOn,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          notifier.isNotificationOn =
                                                              value;
                                                        });
                                                      },
                                                      activeTrackColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .primary,
                                                      activeColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .background,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Sounds",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                              Icon(
                                                  CupertinoIcons.chevron_right),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BlockAppsPage()),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Block Apps",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                              Icon(
                                                  CupertinoIcons.chevron_right),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      GestureDetector(
                                        onTap: () => showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            content: Text("Sacrifice Mode",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.red)),
                                          ),
                                        ),
                                        child: Container(
                                          color: Colors.transparent,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Sacrifice Mode",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: Colors.red)),
                                              Icon(
                                                CupertinoIcons.info_circle,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                              Switch(
                                                value:
                                                    notifier.isNotificationOn,
                                                onChanged: (value) {
                                                  setState(() {
                                                    notifier.isNotificationOn =
                                                        value;
                                                  });
                                                },
                                                activeTrackColor: Colors.red,
                                                activeColor: Theme.of(context)
                                                    .colorScheme
                                                    .background,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          countdownSeconds =
                                              int.parse(fluxDuration) * 60;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Text("Set"),
                                    ),
                                  ],
                                ),
                              );
                            });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "You can't change the settings while the timer is running!",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              )),
                          duration: Duration(seconds: 2),
                        ));
                      }
                    })),
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
                    MaterialPageRoute(builder: (context) => StatsPage()),
                  );
                },
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      sessionCount, // Replace this with your session count variable
                      (index) => Container(
                        margin: EdgeInsets.all(5.0),
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: Colors
                              .transparent, // Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  !notifier.isTimerRunning
                      ? Text(
                          '${countdownSeconds ~/ 60}:${(countdownSeconds % 60).toStringAsFixed(0).padLeft(2, '0')}',
                          style: GoogleFonts.poppins(
                              fontSize: 100,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary))
                      : Countdown(
                          controller: _countdownController,
                          seconds: countdownSeconds,
                          build: (BuildContext context, double time) {
                            String timerValue =
                                '${(time - 1) ~/ 60}:${((time) % 60).toStringAsFixed(0).padLeft(2, '0')}';
                            return Text(
                              timerValue,
                              style: GoogleFonts.poppins(
                                  fontSize: 100,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.primary),
                            );
                          },
                          interval: Duration(milliseconds: 100),
                          onFinished: () {
                            print('Timer is done!');
                            notifier.addCompletedFlux(countdownSeconds);
                            print(notifier.completedFluxes);
                            setState(() {
                              notifier.isTimerRunning = false;
                            });
                          },
                        ),
                  IconButton(
                    icon: Icon(
                      notifier.isTimerRunning
                          ? notifier.isTimerPaused
                              ? CupertinoIcons.play_arrow
                              : CupertinoIcons.pause
                          : CupertinoIcons.play_arrow,
                      size: 40,
                    ),
                    onPressed: () {
                      if (notifier.isTimerRunning) {
                        if (notifier.isTimerPaused) {
                          _countdownController.resume();
                          notifier.isTimerPaused = false;
                          print("isTimerPaused: ${notifier.isTimerPaused}");
                          print("isTimerRunning: ${notifier.isTimerRunning}");
                        } else {
                          _countdownController.pause();
                          notifier.isTimerPaused = true;
                          print("isTimerPaused: ${notifier.isTimerPaused}");
                          print("isTimerRunning: ${notifier.isTimerRunning}");
                        }
                      } else {
                        notifier.isTimerRunning = true;
                        notifier.isTimerPaused = false;
                        print("isTimerPaused: ${notifier.isTimerPaused}");
                        print("isTimerRunning: ${notifier.isTimerRunning}");
                        // Start the timer here
                      }
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
