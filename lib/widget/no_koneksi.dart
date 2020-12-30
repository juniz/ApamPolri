import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoKoneksiPage extends StatelessWidget {
  const NoKoneksiPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            child: Container(
      color: Colors.white,
      child: Center(
        child: LottieBuilder.asset('assets/animation/connection-state.json'),
      ),
    )));
  }
}
