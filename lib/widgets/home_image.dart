import 'package:flutter/material.dart';
import 'dart:async';

class HomeImage extends StatefulWidget {
  const HomeImage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeImageState createState() => _HomeImageState();
}

class _HomeImageState extends State<HomeImage> with SingleTickerProviderStateMixin {
  late final Stream<int> countdownStream;
  late final AnimationController _controller;
  late final Animation<double> _animation;
  bool showCheckMark = false;

  @override
  void initState() {
    super.initState();
    countdownStream = _countdownStream();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);

    Timer(const Duration(seconds: 4), () {
      _controller.stop();
      setState(() {
        showCheckMark = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Stream<int> _countdownStream() async* {
    for (int i = 10; i >= 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
              stream: countdownStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 95.0,
                        backgroundImage: const AssetImage('assets/images/image.jpg'),
                        child: AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.green.withOpacity(_animation.value),
                                  width: 5.0,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      if (showCheckMark)
                        const Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.verified_rounded,
                              color: Colors.green,
                              size: 30.0,
                            ),
                          ),
                        ),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Sukree Hahmah',
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              '6410110118@psu.ac.th',
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              '0626750920',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
