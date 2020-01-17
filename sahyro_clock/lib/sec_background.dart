import 'package:flutter/material.dart';

import 'package:vector_math/vector_math_64.dart' show radians;
import 'glow_sec.dart';

class SecondBackground extends StatefulWidget {
  final Color pinColor;
  SecondBackground(this.pinColor);

  @override
  _SecondBackgroundState createState() => _SecondBackgroundState();
}

class _SecondBackgroundState extends State<SecondBackground> {
  final radiansPerTick = radians(360 / 60);
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Stack(
          children: <Widget>[
            GlowSeconds(
                color: widget.pinColor,
                thickness: 4,
                size: 1,
                angleRadians: 0 * radiansPerTick,
              ),
              GlowSeconds(
                color: Colors.grey[400],
                thickness: 2,
                size: 1,
                angleRadians: 5 * radiansPerTick,
              ),
              GlowSeconds(
                color: Colors.grey[400],
                thickness: 2,
                size: 1,
                angleRadians: 10 * radiansPerTick,
              ),
              GlowSeconds(
                color: widget.pinColor,
                thickness: 4,
                size: 1,
                angleRadians: 15 * radiansPerTick,
              ),
              GlowSeconds(
                color: Colors.grey[400],
                thickness: 2,
                size: 1,
                angleRadians: 20 * radiansPerTick,
              ),
              GlowSeconds(
                color: Colors.grey[400],
                thickness: 2,
                size: 1,
                angleRadians: 25 * radiansPerTick,
              ),
              GlowSeconds(
                color: widget.pinColor,
                thickness: 4,
                size: 1,
                angleRadians: 30 * radiansPerTick,
              ),
              GlowSeconds(
                color: Colors.grey[400],
                thickness: 2,
                size: 1,
                angleRadians: 35 * radiansPerTick,
              ),
              GlowSeconds(
                color: widget.pinColor,
                thickness: 4,
                size: 1,
                angleRadians: 45 * radiansPerTick,
              ),
              GlowSeconds(
                color: Colors.grey[400],
                thickness: 2,
                size: 1,
                angleRadians: 40 * radiansPerTick,
              ),
              GlowSeconds(
                color: Colors.grey[400],
                thickness: 2,
                size: 1,
                angleRadians: 50 * radiansPerTick,
              ),
              GlowSeconds(
                color: Colors.grey[400],
                thickness: 2,
                size: 1,
                angleRadians: 55 * radiansPerTick,
              ),
          ],
        ),
      ),
    );
  }
}
