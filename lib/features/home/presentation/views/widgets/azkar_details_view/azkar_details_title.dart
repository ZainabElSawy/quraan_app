import 'package:flutter/material.dart';

class AzkarDetailsTitle extends StatelessWidget {
  final int titleId;
  const AzkarDetailsTitle({
    Key? key,
    required this.titleId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      titleId == 1
          ? "أذكار الصباح"
          : titleId == 2
              ? "أذكار المساء"
              : titleId == 3
                  ? "أذكار الاستيقاظ من النوم"
                  : titleId == 4
                      ? "أذكار قبل الوضوء"
                      : titleId == 5
                          ? "أذكار النوم"
                          : "الأذكار بعد السلام من الصلاة",
    );
  }
}
