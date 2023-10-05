import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final Color color;
  final Widget child;
  final void Function()? onPressed;
  CustomButton({
    Key? key,
    required this.color,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 43,
      color: color,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: child,
    );
  }
}
