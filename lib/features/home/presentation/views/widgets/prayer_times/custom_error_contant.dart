import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';

class CustomErrorContant extends StatelessWidget {
  final String errMessage;
  const CustomErrorContant({
    Key? key,
    required this.errMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: kPrimaryColor,
          ),
          Text(
            errMessage,
            style: Styles.textStyle22.copyWith(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
