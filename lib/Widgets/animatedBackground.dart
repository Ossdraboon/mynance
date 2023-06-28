import 'package:flutter/material.dart';
import 'package:metaballs/metaballs.dart';


class Animatedbackground extends StatelessWidget {
  const Animatedbackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Metaballs(
        effect: MetaballsEffect.follow(
          growthFactor: 1,
          smoothing: 1,
          radius: 0.5,
        ),
        color: const Color.fromARGB(255, 9, 67, 155),
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 85, 36, 182),
          Color.fromARGB(255, 20, 180, 201),
        ], begin: Alignment.bottomRight, end: Alignment.topLeft),
        metaballs: 50,
        animationDuration: const Duration(milliseconds: 1000),
        speedMultiplier: 1,
        bounceStiffness: 3,
        minBallRadius: 15,
        maxBallRadius: 40,
        glowRadius: 0.7,
        glowIntensity: 0.6,
        child: const Text('METABALLS'));
  }
}