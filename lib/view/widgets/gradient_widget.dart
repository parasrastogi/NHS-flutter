import 'package:flutter/cupertino.dart';

class GradientWidget extends StatelessWidget {
  const GradientWidget({
    Key? key,
    required this.gradientColors,
  }) : super(key: key);

  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width * .45,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 1],
              colors: gradientColors)),
    );
  }
}
