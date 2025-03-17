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
      duration: const Duration(milliseconds: 500),
    );
    animation = Tween<double>(begin: 0.2, end: .8).animate(animationController);

    animationController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose(); // وقّف الـ Controller لما الـ Widget يتشال
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.child,
    );
  }
}
