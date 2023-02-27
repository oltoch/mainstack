// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

class OnTapFade extends StatelessWidget {
  const OnTapFade({Key? key, required this.child, this.onTap})
      : super(key: key);
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ValueBuilder<bool?>(
      builder: (tappedDown, updateFn) {
        return GestureDetector(
          onTapDown: (tapDetails) {
            if(context.mounted) updateFn(true);
          },
          onTapUp: (tapDetails) async {
            await Future.delayed(const Duration(milliseconds: 100));
            if(context.mounted) updateFn(false);
          },
          onPanStart: (tapDetails) {
            if(context.mounted) updateFn(true);
          },
          onPanEnd: (tapDetails) async {
            await Future.delayed(const Duration(milliseconds: 100));
            if(context.mounted) updateFn(false);
          },
          onPanCancel: () async {
            await Future.delayed(const Duration(milliseconds: 100));
            if(context.mounted) updateFn(false);
          },
          onTap: onTap,
          child: Opacity(
            opacity: tappedDown! ? .5 : 1,
            child: child,
          ),
        );
      },
      initialValue: false,
    );
  }
}
