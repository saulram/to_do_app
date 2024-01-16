import 'package:flutter/material.dart';

enum NeumorphicDirection { inside, outside }

class NeumorphicContainer extends StatelessWidget {
  final Widget? child;
  final double customPadding;
  final NeumorphicDirection? direction;

  const NeumorphicContainer(
      {super.key,
      this.child = const SizedBox(),
      this.customPadding = 16,
      this.direction = NeumorphicDirection.outside});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    //if direction is inside, the shadow is inside the container
    return Container(
      padding: EdgeInsets.all(customPadding),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(32),
        boxShadow: _buildShadows(theme),
      ),
      child: child,
    );
  }

  List<BoxShadow> _buildShadows(ThemeData theme) {
    //if direction is inside, the shadow is inside the container
    if (direction == NeumorphicDirection.inside) {
      return [
        BoxShadow(
            offset: Offset(-3,-6),
            color: theme.shadowColor,
            blurRadius: 6,
            spreadRadius: 0),

      ];
    }
    return [
      BoxShadow(
          offset: Offset(-1, -1),
          color: theme.scaffoldBackgroundColor,
          blurRadius: 0,
          spreadRadius: 0),
      BoxShadow(
          offset: Offset(-2, -2),
          color: theme.shadowColor,
          blurRadius: 2,
          spreadRadius: 0),
      BoxShadow(
          offset: Offset(1, 1),
          color: theme.scaffoldBackgroundColor,
          blurRadius: 0,
          spreadRadius: 0),
      BoxShadow(
          offset: Offset(2, 2),
          color: theme.shadowColor,
          blurRadius: 2,
          spreadRadius: 0),
    ];
  }
}
