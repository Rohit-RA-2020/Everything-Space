import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  )..repeat(reverse: true);

  late final Animation<Offset> _animation = Tween(
    begin: const Offset(0, 0.0),
    end: const Offset(0, 0.30),
  ).animate(_controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _animation,
              child: SvgPicture.asset(
                'assets/svg/space_shuttle.svg',
                color: const Color(0xFFFFFDD0),
                height: 50,
                width: 50,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Everything Space',
                style: TextStyle(
                  fontFamily: 'Jua',
                  fontSize: 40,
                  color: Color(0xFFFFFDD0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
