import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors.dart';
import 'azkar_details_title.dart';

class AzkarDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final int sectionId;
  const AzkarDetailsAppBar({
    super.key, required this.sectionId,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AzkarDetailsTitle(
        titleId: sectionId,
      ),
      centerTitle: true,
      backgroundColor: kPrimaryColor,
      foregroundColor: kWhiteColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
