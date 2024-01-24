import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux/components/configure_dialog/flux_duration_form.dart';
import 'package:flux/components/countdown_timer_component.dart';
import 'package:flux/notifier/flux_notifier..dart';
import 'package:flux/pages/block_apps.dart';
import 'package:flux/pages/stats.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int breakDuration = 5;
  int longBreakDuration = 30;
  int sessionCount = 4;
  int countdownSeconds = 2;

  late int fluxDuration = 15;

  DateTime remainingTime = DateTime.now().add(Duration(minutes: 15));

  final CountdownController _countdownController =
      new CountdownController(autoStart: true);

  void updateFluxDuration(int newFluxDuration) {
    setState(() {
      fluxDuration = newFluxDuration;
    });
  }

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
                        showFluxConfigDialog(context, size, notifier);
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
                  SessionCountIndicator(sessionCount: sessionCount),
                  CountdownTimerComponent(
                      notifier: notifier,
                      countdownController: _countdownController,
                      countdownSeconds: countdownSeconds),
                  // CountdownTimerControllerButton(
                  //   countdownController: _countdownController,
                  //   notifier: notifier,
                  // ),
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
                        } else {
                          _countdownController.pause();
                          notifier.isTimerPaused = true;
                        }
                      } else {
                        notifier.isTimerRunning = true;
                        notifier.isTimerPaused = false;
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

  Future<dynamic> showFluxConfigDialog(
      BuildContext context, Size size, FluxNotifier notifier) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 5),
            child: AlertDialog(
              backgroundColor:
                  Theme.of(context).colorScheme.background.withOpacity(0.8),
              title: Text("Configure",
                  style: GoogleFonts.poppins(
                      fontSize: 25, fontWeight: FontWeight.w800)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FluxDurationForm(
                    fluxDuration: fluxDuration,
                    onFluxDurationChanged: updateFluxDuration,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  DropdownButtonFormField(
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800))))
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800))))
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
                      builder: (BuildContext context) => AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Ticking Sound",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                                Switch(
                                  value: notifier.isTickingSoundOn,
                                  onChanged: (value) {
                                    setState(() {
                                      notifier.isTickingSoundOn = value;
                                    });
                                  },
                                  activeTrackColor:
                                      Theme.of(context).colorScheme.primary,
                                  activeColor:
                                      Theme.of(context).colorScheme.background,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Background Sound",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                                Switch(
                                  value: notifier.isBackgroundSoundOn,
                                  onChanged: (value) {
                                    setState(() {
                                      notifier.isBackgroundSoundOn = value;
                                    });
                                  },
                                  activeTrackColor:
                                      Theme.of(context).colorScheme.primary,
                                  activeColor:
                                      Theme.of(context).colorScheme.background,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Notifications",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                                Switch(
                                  value: notifier.isNotificationOn,
                                  onChanged: (value) {
                                    setState(() {
                                      notifier.isNotificationOn = value;
                                    });
                                  },
                                  activeTrackColor:
                                      Theme.of(context).colorScheme.primary,
                                  activeColor:
                                      Theme.of(context).colorScheme.background,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sounds",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                          Icon(CupertinoIcons.chevron_right),
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
                            builder: (context) => BlockAppsPage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Block Apps",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                          Icon(CupertinoIcons.chevron_right),
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
                      builder: (BuildContext context) => AlertDialog(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sacrifice Mode",
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.red)),
                          Icon(
                            CupertinoIcons.info_circle,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Switch(
                            value: notifier.isNotificationOn,
                            onChanged: (value) {
                              setState(() {
                                notifier.isNotificationOn = value;
                              });
                            },
                            activeTrackColor: Colors.red,
                            activeColor:
                                Theme.of(context).colorScheme.background,
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
                      countdownSeconds = fluxDuration * 60;
                    });
                    Navigator.pop(context);
                  },
                  child: Text("Set"),
                ),
              ],
            ),
          );
        });
  }
}

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
