import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WaveSection extends StatelessWidget {
  const WaveSection({
    Key key,
    @required this.backgroundColor,
  }) : super(key: key);

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return WaveWidget(
      config: CustomConfig(
        durations: [35000, 19440, 10800, 6000],
        heightPercentages: [0.70, 0.73, 0.75, 0.80],
        blur: MaskFilter.blur(BlurStyle.solid, 10),
        colors: [
          Colors.white54,
          Colors.white30,
          Colors.white24,
          Colors.white,
        ],
      ),
      waveAmplitude: 3,
      backgroundColor: backgroundColor,
      size: Size(
        double.infinity,
        double.infinity,
      ),
    );
  }
}
