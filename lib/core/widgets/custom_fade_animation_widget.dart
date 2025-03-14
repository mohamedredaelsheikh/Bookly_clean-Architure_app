import 'package:flutter/material.dart';

class CustomFadeAnimationWidget extends StatefulWidget {
  const CustomFadeAnimationWidget({super.key, required this.child});
  final Widget child;

  @override
  State<CustomFadeAnimationWidget> createState() =>
      _CustomFadeAnimationWidgetState();
}

class _CustomFadeAnimationWidgetState extends State<CustomFadeAnimationWidget>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    animation = Tween<double>(begin: 0.2, end: .8).animate(animationController);
    setState(() {
      animationController.addListener(() {
        setState(() {});
      });
    });
    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.child,
    );
  }
}
