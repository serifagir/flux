import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux/components/configure_dialog/break_duration_form.dart';
import 'package:flux/components/configure_dialog/flux_duration_form.dart';
import 'package:flux/components/configure_dialog/long_break_duration_form.dart';
import 'package:flux/components/configure_dialog/session_count_form.dart';
import 'package:flux/components/countdown_timer_component.dart';
import 'package:flux/components/session_count_indicator.dart';
import 'package:flux/components/session_name_indicator.dart';
import 'package:flux/notifier/flux_notifier.dart';
import 'package:flux/pages/settings.dart';
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

  late int fluxDuration = 15;

  final CountdownController _countdownController =
      CountdownController(autoStart: true);

  void updateFluxDuration(int newFluxDuration) {
    setState(() {
      fluxDuration = newFluxDuration;
    });
  }

  void updateBreakDuration(int newBreakDuration) {
    setState(() {
      breakDuration = newBreakDuration;
    });
  }

  void updateLongBreakDuration(int newLongBreakDuration) {
    setState(() {
      longBreakDuration = newLongBreakDuration;
    });
  }

  void updateSessionCount(int newSessionCount) {
    setState(() {
      sessionCount = newSessionCount;
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
                  Icons.settings,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const SettingsPage(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = Offset(0.0, 1.0);
                        var end = Offset.zero;
                        var curve = Curves.ease;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Positioned(
                bottom: size.height * 0.05,
                left: 60,
                child: IconButton(
                    icon: const Icon(
                      CupertinoIcons.waveform,
                      size: 30,
                    ),
                    onPressed: () {
                      // if (!notifier.isTimerRunning) {
                      showFluxConfigDialog(context, size, notifier);
                      // } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "You can't change the settings while the timer is running!",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            )),
                        duration: const Duration(seconds: 2),
                      ));
                      // }
                    })),
            Positioned(
                bottom: size.height * 0.05,
                right: 60,
                child: IconButton(
                    icon: const Icon(
                      CupertinoIcons.paintbrush,
                      size: 30,
                    ),
                    onPressed: () {
                      // if (!notifier.isTimerRunning) {
                      showFluxConfigDialog(context, size, notifier);
                      // } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "You can't change the settings while the timer is running!",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            )),
                        duration: const Duration(seconds: 2),
                      ));
                      // }
                    })),
            Positioned(
              bottom: size.height * 0.05,
              right: 15,
              child: IconButton(
                icon: const Icon(
                  CupertinoIcons.chart_bar_square,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const StatsPage(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = Offset(0.0, 1.0);
                        var end = Offset.zero;
                        var curve = Curves.ease;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SessionNameIndicator(
                    notifier: notifier,
                  ),
                  // SessionCountIndicator(
                  //   sessionCount: sessionCount,
                  //   session: notifier._sessionsCompleted,
                  // ),
                  CountdownTimerComponent(
                      notifier: notifier,
                      countdownController: _countdownController,
                      countdownSeconds: notifier.countdownSeconds),
                  // CountdownTimerControllerButton(
                  //   countdownController: _countdownController,
                  //   notifier: notifier,
                  // ),
                  IconButton(
                      icon: Icon(
                        Icons.play_arrow,
                        size: 40,
                      ),
                      onPressed: () {
                        notifier.startNextTimer();
                      }),
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
                    onFluxDurationChanged: updateFluxDuration,
                    notifier: notifier,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  BreakDurationForm(
                    onBreakDurationChanged: updateBreakDuration,
                    notifier: notifier,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  LongBreakDurationForm(
                    onLongBreakDurationChanged: updateLongBreakDuration,
                    notifier: notifier,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SessionCountForm(
                    onSessionCountChanged: updateSessionCount,
                    notifier: notifier,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
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
                      notifier.countdownSeconds = fluxDuration * 60;
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
