import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:primeiro/Widgets/cnpj_form.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController lottieController;
  bool isPlaying = false;
  bool showButton = false;

  @override
  void initState() {
    lottieController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 8000),
    );

    togglePlay();

    Future.delayed(Duration(milliseconds: 5000)).then((_) async {
      togglePlay();

      await Future.delayed(Duration(seconds: 3));
      setState(() {
        showButton = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    lottieController.stop();
    lottieController.dispose();
    super.dispose();
  }

  void togglePlay() {
    setState(() {
      if (isPlaying) {
        lottieController.stop();
      } else {
        lottieController.forward(from: lottieController.value);
      }
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
            child: Lottie.asset(
              'assets/splashAnimation.json',
              controller: lottieController,
            ),
          ),
          AnimatedCrossFade(
            firstChild: SizedBox(),
            secondChild: SizedBox(
              width: 80,
              child: LinearProgressIndicator(
                color: Colors.grey.shade300,
                backgroundColor: Colors.grey.shade100,
              ),
            ),
            crossFadeState: !isPlaying && !showButton
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: Duration(milliseconds: 300),
          ),
          AnimatedCrossFade(
            sizeCurve: Curves.easeInOutQuad,
            firstChild: SizedBox(),
            secondChild: CnpjForm(togglePlay: togglePlay),
            crossFadeState: showButton
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}
