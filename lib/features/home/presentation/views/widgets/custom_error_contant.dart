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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              color: kPrimaryColor,
              size: 30,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                errMessage,
                style: Styles.textStyle22.copyWith(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
