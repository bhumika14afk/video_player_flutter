import 'package:flutter/material.dart';
import 'package:youtube/views/widgets/video_list.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: const [
                SizedBox(height: 30),
                Expanded(child: VideoList()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
