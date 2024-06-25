import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ContainerLoadingAnimation extends StatelessWidget {
  const ContainerLoadingAnimation({
    Key? key,
    required this.radius,
    required this.height,
  }) : super(key: key);
  final double radius;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Shimmer.fromColors(
        baseColor: const Color.fromARGB(172, 96, 125, 139),
        highlightColor: Colors.white,
        child: Container(
          constraints: BoxConstraints(
            minHeight: height,
            maxHeight: height,
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(71, 142, 206, 238),
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
      ),
    );
  }
}
