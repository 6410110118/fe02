import 'package:flutter/material.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 95.0, // Increased radius to fit the image size
                      backgroundImage: AssetImage('assets/images/image.jpg'),
                    ),
                    Positioned(
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
                ),
                SizedBox(height: 20.0),
                Text(
                  'Sukree Hahmah',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '6410110118@psu.ac.th',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '0626750920',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
