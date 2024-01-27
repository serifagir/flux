import 'package:flutter/material.dart';
import 'package:flux/components/main_page_components/session_control_buttons.dart';
import 'package:flux/components/main_page_components/session_name_indicator.dart';
import 'package:flux/components/main_page_components/session_timer.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SessionNameIndicator(),
              SessionTimer(),
              SessionControlButtons(),
            ],
          ),
        ],
      )),
    );
  }
}
