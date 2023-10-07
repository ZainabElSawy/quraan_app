import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/colors.dart';

// ignore: must_be_immutable
class CustomCheckBox extends StatefulWidget {
  bool val;
  CustomCheckBox({Key? key, required this.val}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: kPrimaryColor,
      value: widget.val,
      onChanged: (value) {
        setState(
          () {
            widget.val = value ?? false;
          },
        );
      },
    );
  }
}
